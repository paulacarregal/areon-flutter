import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import './place_provider.dart';
import './place_card.dart';
import './alert_marker_widget.dart';
import './map_search_bar.dart';
import './weather_panel.dart';
import '../../alerts/presentation/alert_provider.dart';
import '../../../shared/theme/colors.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final _mapController    = MapController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final placeProvider = context.watch<PlaceProvider>();
    final alertProvider = context.watch<AlertProvider>();
    final places = placeProvider.filtered;
    final alerts = alertProvider.alerts;

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: LatLng(-23.5505, -46.6333),
              initialZoom: 17,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
              ),
              MarkerLayer(
                markers: places.map((place) {
                  return Marker(
                    point: LatLng(place.latitude, place.longitude),
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.location_on,
                        color: Colors.lightBlueAccent, size: 30),
                  );
                }).toList(),
              ),
              MarkerLayer(
                markers: alerts.map((alert) {
                  return Marker(
                    point: LatLng(alert.latitude, alert.longitude),
                    width: 40,
                    height: 40,
                    child: AlertMarkerWidget(alert: alert),
                  );
                }).toList(),
              ),
            ],
          ),
          MapSearchBar(
            controller: _searchController,
            onFirstResultCoords: [],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            minChildSize: 0.20,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.sheetBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.sheetShadow,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 12),
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const WeatherPanel(),
                    if (places.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(24),
                        child: Center(
                          child: Text('Nenhum local encontrado',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16)),
                        ),
                      ),
                    _PlaceSection(title: 'Hora do Almoço', places: places),
                    const SizedBox(height: 24),
                    _PlaceSection(title: 'Para Explorar', places: places),
                    const SizedBox(height: 40),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PlaceSection extends StatelessWidget {
  final String title;
  final List places;

  const _PlaceSection({required this.title, required this.places});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            padding: const EdgeInsets.only(left: 24, right: 8),
            itemBuilder: (_, index) =>
                PlaceCard(place: places[index]),
          ),
        ),
      ],
    );
  }
}
