import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/alert.dart';
import 'logging_service.dart';
import 'metrics_service.dart';

class AlertService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Alert>> getAlerts() {
    log.info('Alerts', 'stream subscribed');
    metrics.increment('aeon.alerts.stream.subscriptions');

    return firestore.collection('alertas').snapshots().map((snapshot) {
      final all = snapshot.docs.map((doc) {
        return Alert.fromMap(doc.id, doc.data());
      }).toList();

      final active = all.where((a) => a.ativo).length;
      metrics.gauge('aeon.alerts.active.count', active);
      metrics.gauge('aeon.alerts.total.count', all.length);
      log.debug('Alerts', 'snapshot received',
          extra: {'total': all.length, 'active': active});

      return all;
    });
  }
}
