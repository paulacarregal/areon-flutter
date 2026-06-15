import 'dart:async';
import 'package:flutter/material.dart';
import '../models/alert.dart';
import '../services/alert_service.dart';

class AlertProvider extends ChangeNotifier {
  final AlertService _alertService = AlertService();

  List<Alert> _alerts = [];
  StreamSubscription<List<Alert>>? _subscription;

  List<Alert> get alerts => _alerts;

  List<Alert> get alertsAtivos => _alerts.where((a) => a.ativo).toList();

  void startListening() {
    _subscription?.cancel();
    _subscription = _alertService.getAlerts().listen((data) {
      _alerts = data;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
