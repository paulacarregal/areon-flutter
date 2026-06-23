import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/constants/firestore_paths.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<Map<String, dynamic>?> _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    final doc = await FirebaseFirestore.instance
        .collection(FirestorePaths.users)
        .doc(user.uid)
        .get();
    return doc.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF5),
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>?>(
          future: _getUserData(),
          builder: (context, snapshot) {
            final userData = snapshot.data;
            final nome = userData?['nome'] ?? 'Usuário';
            final email = userData?['email'] ?? '';

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 50, left: 20, right: 20),
                        padding: const EdgeInsets.only(
                            top: 70, left: 20, right: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(blurRadius: 8, color: Colors.black12)
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(nome,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                    Text(email,
                                        style: const TextStyle(
                                            color: Colors.grey)),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.analytics),
                                    SizedBox(width: 16),
                                    Icon(Icons.settings),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: const [
                                _StatCard(number: '44', label: 'Postagens'),
                                _StatCard(number: '4437', label: 'Seguidores'),
                                _StatCard(number: '48', label: 'Seguindo'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(
                          (userData != null &&
                                  userData['photoUrl'] != null &&
                                  userData['photoUrl'].toString().isNotEmpty)
                              ? userData['photoUrl']
                              : 'assets/images/places/blair.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Destaques',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            _HighlightButton(icon: Icons.business),
                            SizedBox(width: 12),
                            _HighlightButton(icon: Icons.shield),
                            SizedBox(width: 12),
                            _HighlightButton(icon: Icons.park),
                            SizedBox(width: 12),
                            _HighlightButton(icon: Icons.add),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Column(
                      children: [
                        _ReviewCard(
                            title: 'Terraço Jardins',
                            type: 'Restaurante',
                            price: 'R\$200-250',
                            rating: '5'),
                        SizedBox(height: 12),
                        _ReviewCard(
                            title: 'Bar Tan Tan',
                            type: 'Bares',
                            price: 'R\$50-55',
                            rating: '4'),
                        SizedBox(height: 12),
                        _ReviewCard(
                            title: 'Exposição',
                            type: 'Exposição',
                            price: 'R\$20-25',
                            rating: '5'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;

  const _StatCard({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _HighlightButton extends StatelessWidget {
  final IconData icon;

  const _HighlightButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String title;
  final String type;
  final String price;
  final String rating;

  const _ReviewCard({
    required this.title,
    required this.type,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: const Color(0xFFEBEBEB),
      collapsedBackgroundColor: const Color(0xFFEBEBEB),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title:
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$type • $price'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(rating),
          const Icon(Icons.star, color: Colors.amber),
        ],
      ),
      children: const [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
              'Ambiente muito agradável e bem localizado. Ideal para um happy hour tranquilo.'),
        ),
      ],
    );
  }
}
