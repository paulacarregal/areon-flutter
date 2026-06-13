import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String nome,
    required String email,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .set({
      'uid': uid,
      'nome': nome,
      'email': email,
      'createdAt': Timestamp.now(),
    });
  }
}