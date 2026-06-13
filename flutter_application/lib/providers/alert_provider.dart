import 'package:flutter/material.dart';
import '../models/alert.dart';
import '../services/alert_service.dart';

class AlertProvider extends ChangeNotifier {
  final AlertService _alertService = AlertService();

  List<Alert> _alerts = [];

  List<Alert> get alerts => _alerts;

  void startListening() {
    _alertService.getAlerts().listen((data) {
      _alerts = data;
      notifyListeners();
    });
  }
}