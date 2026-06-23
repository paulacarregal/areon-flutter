import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './place_provider.dart';

class MapSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final List<double Function()> onFirstResultCoords;

  const MapSearchBar({
    super.key,
    required this.controller,
    required this.onFirstResultCoords,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          controller: controller,
          onChanged: (query) =>
              context.read<PlaceProvider>().search(query),
          decoration: const InputDecoration(
            hintText: 'Pesquisar...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
