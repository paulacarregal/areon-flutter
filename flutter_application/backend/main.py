import json
import math
import os
from pathlib import Path
from typing import Any

import httpx
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field

load_dotenv()


def _origins() -> list[str]:
    raw = os.getenv("ALLOWED_ORIGINS", "http://localhost,http://127.0.0.1")
    return [origin.strip() for origin in raw.split(",") if origin.strip()]


app = FastAPI(title="AEON Backend", version="0.1.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=_origins(),
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class WeatherRequest(BaseModel):
    city: str = Field(default="Sao Paulo", min_length=1)


class PlaceCandidate(BaseModel):
    id: str | None = None
    name: str
    rating: float = 0
    tags: list[str] = Field(default_factory=list)
    indoor: bool = True
    distanceMeters: float | None = None


class RecommendationProfile(BaseModel):
    name: str | None = None
    preferredTags: list[str] = Field(default_factory=list)


class RecommendationContext(BaseModel):
    raining: bool = False
    night: bool = False
    maxDistanceMeters: float | None = None
    transportMode: str | None = None


class DeviceContext(BaseModel):
    latitude: float | None = None
    longitude: float | None = None
    weatherDescription: str | None = None
    temperature: float | None = None
    transportMode: str | None = None


class NotificationContextRequest(BaseModel):
    profile: RecommendationProfile = Field(default_factory=RecommendationProfile)
    device: DeviceContext = Field(default_factory=DeviceContext)


class RecommendPlacesRequest(BaseModel):
    profile: RecommendationProfile = Field(default_factory=RecommendationProfile)
    places: list[PlaceCandidate] = Field(default_factory=list)
    context: RecommendationContext = Field(default_factory=RecommendationContext)


class ReviewValidationRequest(BaseModel):
    userId: str
    placeId: str | None = None
    placeName: str = Field(min_length=1)
    address: str = Field(min_length=1)
    rating: int = Field(ge=1, le=5)
    comment: str = ""
    tags: list[str] = Field(default_factory=list)
    spendRange: str | None = None


CATALOG_PATH = Path(__file__).parent / "data" / "sp_catalog.json"


def _load_catalog() -> list[dict[str, Any]]:
    with CATALOG_PATH.open("r", encoding="utf-8") as file:
        return json.load(file)


@app.get("/health")
def health() -> dict[str, Any]:
    return {"ok": True, "service": "aeon-fastapi-backend"}


@app.get("/catalog")
def catalog() -> dict[str, Any]:
    items = _load_catalog()
    return {"items": items, "count": len(items)}


@app.get("/catalog/{place_id}/review-prompts")
def review_prompts(place_id: str) -> dict[str, Any]:
    item = next((item for item in _load_catalog() if item["id"] == place_id), None)
    if not item:
        raise HTTPException(status_code=404, detail="Local nao encontrado.")

    return {
        "placeId": item["id"],
        "name": item["name"],
        "profileHints": item.get("profileHints", []),
        "reviewPrompts": item.get("reviewPrompts", []),
        "tags": item.get("tags", []),
    }


@app.post("/weather")
async def weather(payload: WeatherRequest) -> dict[str, Any]:
    key = os.getenv("OPENWEATHER_KEY", "").strip()
    if not key:
        raise HTTPException(
            status_code=500,
            detail="OPENWEATHER_KEY nao configurada no backend.",
        )

    params = {
        "q": payload.city,
        "units": "metric",
        "lang": "pt_br",
        "appid": key,
    }

    async with httpx.AsyncClient(timeout=12) as client:
        response = await client.get(
            "https://api.openweathermap.org/data/2.5/weather",
            params=params,
        )

    data = response.json()
    if response.status_code >= 400:
        raise HTTPException(
            status_code=response.status_code,
            detail={"provider": "openweather", "response": data},
        )

    return {
        "temperature": float(data.get("main", {}).get("temp", 0)),
        "humidity": int(data.get("main", {}).get("humidity", 0)),
        "windSpeed": float(data.get("wind", {}).get("speed", 0)),
        "description": str((data.get("weather") or [{}])[0].get("description", "")),
    }


@app.post("/recommend-places")
@app.post("/recommendPlaces")
def recommend_places(payload: RecommendPlacesRequest) -> dict[str, Any]:
    ranked = [
        {
            **place.model_dump(),
            "score": _score_place(place, payload.profile, payload.context),
        }
        for place in payload.places
    ]
    ranked.sort(key=lambda place: place["score"], reverse=True)

    return {
        "recommendations": ranked[:5],
        "message": _recommendation_message(ranked[0] if ranked else None, payload.context),
    }


@app.post("/notification-context")
@app.post("/notificationContext")
def notification_context(payload: NotificationContextRequest) -> dict[str, Any]:
    context = _context_from_device(payload.device)
    candidates = [
        {
            **item,
            "distanceMeters": _distance_meters(
                payload.device.latitude,
                payload.device.longitude,
                item["latitude"],
                item["longitude"],
            ),
        }
        for item in _load_catalog()
    ]

    ranked = [
        {
            **candidate,
            "score": _score_catalog_item(candidate, payload.profile, context),
        }
        for candidate in candidates
    ]
    ranked.sort(key=lambda item: item["score"], reverse=True)

    selected = ranked[0] if ranked else None
    return {
        "notification": _build_notification(selected, context),
        "selected": selected,
        "alternatives": ranked[1:4],
        "context": context.model_dump(),
    }


@app.post("/reviews/validate")
@app.post("/reviews/validate-and-enrich")
def validate_review(payload: ReviewValidationRequest) -> dict[str, Any]:
    catalog_item = _find_catalog_item(payload.placeId, payload.placeName)
    catalog_tags = set(catalog_item.get("tags", []) if catalog_item else [])
    user_tags = {_normalize_tag(tag) for tag in payload.tags if tag.strip()}
    tags = sorted(catalog_tags.union(user_tags))

    place_id = payload.placeId or (
        catalog_item.get("id") if catalog_item else _slugify(payload.placeName)
    )

    return {
        "userId": payload.userId,
        "placeId": place_id,
        "placeName": catalog_item.get("name") if catalog_item else payload.placeName.strip(),
        "address": catalog_item.get("address") if catalog_item else payload.address.strip(),
        "rating": payload.rating,
        "comment": payload.comment.strip(),
        "tags": tags,
        "spendRange": payload.spendRange.strip() if payload.spendRange else None,
        "profileHints": catalog_item.get("profileHints", []) if catalog_item else [],
        "reviewPrompts": catalog_item.get("reviewPrompts", []) if catalog_item else [],
        "source": "aeon-fastapi",
        "status": "validated",
    }


def _score_place(
    place: PlaceCandidate,
    profile: RecommendationProfile,
    context: RecommendationContext,
) -> int:
    place_tags = set(place.tags)
    preferred_tags = set(profile.preferredTags)
    score = place.rating * 2

    score += len(place_tags.intersection(preferred_tags)) * 12

    if context.raining and place.indoor:
        score += 8
    if context.night and "night" in place_tags:
        score += 6
    if not context.night and "day" in place_tags:
        score += 6
    if context.maxDistanceMeters and place.distanceMeters:
        score += max(0, 8 - place.distanceMeters / 500)

    return round(score)


def _recommendation_message(
    place: dict[str, Any] | None,
    context: RecommendationContext,
) -> str:
    if not place:
        return "Tem uma experiencia esperando por voce."
    if context.raining:
        return f"{place['name']} combina com agora e fica protegido do clima."
    return f"{place['name']} combina com seu perfil hoje."


def _context_from_device(device: DeviceContext) -> RecommendationContext:
    description = (device.weatherDescription or "").lower()
    raining = any(term in description for term in ["chuva", "rain", "garoa"])
    night = _is_night_now()
    return RecommendationContext(
        raining=raining,
        night=night,
        maxDistanceMeters=3500,
        transportMode=device.transportMode,
    )


def _score_catalog_item(
    item: dict[str, Any],
    profile: RecommendationProfile,
    context: RecommendationContext,
) -> int:
    place = PlaceCandidate(
        id=item["id"],
        name=item["name"],
        rating=float(item.get("rating", 0)),
        tags=list(item.get("tags", [])),
        indoor=bool(item.get("indoor", True)),
        distanceMeters=item.get("distanceMeters"),
    )
    score = _score_place(place, profile, context)

    if item.get("kind") == "event":
        score += 5
    if context.raining and not item.get("indoor", True):
        score -= 12
    if item.get("distanceMeters") is not None:
        score += max(0, 10 - item["distanceMeters"] / 600)

    return round(score)


def _build_notification(
    item: dict[str, Any] | None,
    context: RecommendationContext,
) -> dict[str, Any]:
    if not item:
        return {
            "title": "AEON",
            "body": "Tem uma experiencia em SP que combina com voce.",
            "type": "recommendation",
        }

    template = item.get("notificationTemplate", "{name} combina com seu perfil.")
    body = template.format(**item)
    if context.raining and item.get("indoor"):
        body = f"{body} E ainda fica protegido do clima."

    return {
        "title": "AEON recomenda",
        "body": body,
        "type": "recommendation",
        "placeId": item.get("id"),
        "latitude": item.get("latitude"),
        "longitude": item.get("longitude"),
    }


def _find_catalog_item(place_id: str | None, place_name: str) -> dict[str, Any] | None:
    normalized_name = _slugify(place_name)
    for item in _load_catalog():
        if place_id and item.get("id") == place_id:
            return item
        if _slugify(item.get("name", "")) == normalized_name:
            return item
    return None


def _normalize_tag(tag: str) -> str:
    return (
        tag.strip()
        .lower()
        .replace(" ", "-")
        .replace("á", "a")
        .replace("à", "a")
        .replace("ã", "a")
        .replace("â", "a")
        .replace("é", "e")
        .replace("ê", "e")
        .replace("í", "i")
        .replace("ó", "o")
        .replace("ô", "o")
        .replace("õ", "o")
        .replace("ú", "u")
        .replace("ç", "c")
    )


def _slugify(value: str) -> str:
    normalized = _normalize_tag(value)
    return "".join(char for char in normalized if char.isalnum() or char == "-")


def _is_night_now() -> bool:
    from datetime import datetime

    hour = datetime.now().hour
    return hour >= 18 or hour < 6


def _distance_meters(
    lat1: float | None,
    lon1: float | None,
    lat2: float,
    lon2: float,
) -> float | None:
    if lat1 is None or lon1 is None:
        return None

    radius = 6371000
    phi1 = math.radians(lat1)
    phi2 = math.radians(lat2)
    delta_phi = math.radians(lat2 - lat1)
    delta_lambda = math.radians(lon2 - lon1)

    a = (
        math.sin(delta_phi / 2) ** 2
        + math.cos(phi1) * math.cos(phi2) * math.sin(delta_lambda / 2) ** 2
    )
    return radius * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
