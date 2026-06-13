import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // ADICIONADO
import '../models/alert.dart';
import '../services/alert_service.dart';

class AlertProvider extends ChangeNotifier {
  final AlertService _alertService = AlertService();

  List<Alert> _alerts = [];
  List<Alert> get alerts => _alerts;

  /// Transforma a lista de Alertas em Marcadores para o Google Maps em tempo real
  Set<Marker> get mapMarkers {
    return _alerts.map((alert) {
      // Define a cor do marcador baseado no nível do alerta (opcional/customizável)
      double markerColor;
      if (alert.nivel.toLowerCase() == 'alto' || alert.nivel.toLowerCase() == 'critico') {
        markerColor = BitmapDescriptor.hueRed;
      } else if (alert.nivel.toLowerCase() == 'medio') {
        markerColor = BitmapDescriptor.hueOrange;
      } else {
        markerColor = BitmapDescriptor.hueAzure; // Azul para nível baixo/normal
      }

      return Marker(
        markerId: MarkerId('${alert.latitude}_${alert.longitude}'),
        position: LatLng(alert.latitude, alert.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
        infoWindow: InfoWindow(
          title: alert.titulo,
          snippet: alert.descricao,
        ),
      );
    }).toSet();
  }

  void startListening() {
    _alertService.getAlerts().listen((data) {
      // Filtra para mostrar no mapa apenas os alertas que estão ativos (se fizer sentido para a lógica)
      _alerts = data.where((alert) => alert.ativo).toList();
      notifyListeners();
    });
  }
}