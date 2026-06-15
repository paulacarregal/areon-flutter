import '../models/place.dart';

List<Place> getAllPlaces() {
  return [
    Place(
      name: "Bar Tan Tan",
      rating: 4.8,
      priceRange: "R\$50",
      horario: "18:00",
      distancia: "500m",
      image: "assets/images/places/bar_tan_tan_1.jpg",
      latitude: -23.5505,
      longitude: -46.6333,

      
    ),

    Place(
      name: "Café Central",
      rating: 4.5,
      priceRange: "R\$25",
      horario: "08:00",
      distancia: "800m",
      image: "assets/images/places/cafe_central_2.png",
      latitude: -23.5520,
      longitude: -46.6320,
    ),

    Place(
      name: "Vista Rooftop",
      rating: 4.9,
      priceRange: "R\$90",
      horario: "17:00",
      distancia: "1.2km",
      image: "assets/images/places/vista_rooftop_3.jpg",
      latitude: -23.5490,
      longitude: -46.6350,
    ),

    Place(
      name: "Mercado Gourmet",
      rating: 4.7,
      priceRange: "R\$45",
      horario: "11:00",
      distancia: "700m",
      image: "assets/images/places/mercado_gourmet.jpg",
      latitude: -23.5512,
      longitude: -46.6318,
    ),

    Place(
      name: "Perseu Coffee House",
      rating: 4.6,
      priceRange: "R\$20",
      horario: "07:00",
      distancia: "600m",
      image: "assets/images/places/coffee_house.jpg",
      latitude: -23.5530,
      longitude: -46.6340,
    ),

    //cultura

    Place(
      name: "Museu Urbano",
      rating: 4.9,
      priceRange: "R\$30",
      horario: "09:00",
      distancia: "1.5km",
      image: "assets/images/places/museu_urbano.jpg",
      latitude: -23.5485,
      longitude: -46.6362,
    ),

    Place(
      name: "Galeria Arte SP",
      rating: 4.8,
      priceRange: "R\$25",
      horario: "10:00",
      distancia: "2km",
      image: "assets/images/places/galeria_sp.jpg",
      latitude: -23.5478,
      longitude: -46.6370,
    ),

    // natureza

    Place(
      name: "Parque Ibirapuera",
      rating: 4.9,
      priceRange: "Grátis",
      horario: "06:00",
      distancia: "2.3km",
      image: "assets/images/places/parque_verde.jpg",
      latitude: -23.5545,
      longitude: -46.6290,
    ),

    //vida noturna

    Place(
      name: "Sky Lounge",
      rating: 4.8,
      priceRange: "R\$80",
      horario: "18:00",
      distancia: "1.8km",
      image: "assets/images/places/sky_lounge.jpg",
      latitude: -23.5498,
      longitude: -46.6315,
    ),


  ];
}