import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/alert.dart';

class AlertService {
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Stream<List<Alert>> getAlerts() {
    return firestore
        .collection('alertas')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Alert.fromMap(doc.data());
      }).toList();
    });
  }
}