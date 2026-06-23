import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/constants/firestore_paths.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String nome,
    required String email,
  }) async {
    await _db.collection(FirestorePaths.users).doc(uid).set({
      'uid': uid,
      'nome': nome,
      'email': email,
      'createdAt': Timestamp.now(),
    });
  }
}
