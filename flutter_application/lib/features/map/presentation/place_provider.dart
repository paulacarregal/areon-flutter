import 'package:flutter/material.dart';

import '../domain/place.dart';
import '../data/place_repository.dart';

class PlaceProvider extends ChangeNotifier {
  List<Place> _places = [];
  List<Place> _filtered = [];
  bool _loading = false;
  String? _error;

  List<Place> get places => _places;
  List<Place> get filtered => _filtered;
  bool get loading => _loading;
  String? get error => _error;

  PlaceProvider() {
    _load();
  }

  void _load() {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _places = getAllPlaces();
      _filtered = List.from(_places);
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      _filtered = List.from(_places);
    } else {
      _filtered = _places
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _filtered = List.from(_places);
    notifyListeners();
  }
}
