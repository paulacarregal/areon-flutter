import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './post_provider.dart';
import './post_detail_screen.dart';
import '../../auth/presentation/auth_provider.dart' as app;
import '../../../core/constants/firestore_paths.dart';
import '../../../shared/widgets/post_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  Future<String> _getNomeUsuario() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return 'Explorador';
      final doc = await FirebaseFirestore.instance
          .collection(FirestorePaths.users)
          .doc(user.uid)
          .get();
      return doc.data()?['nome'] ?? 'Explorador';
    } catch (_) {
      return 'Explorador';
    }
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = context.watch<PostProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: FutureBuilder<String>(
          future: _getNomeUsuario(),
          builder: (context, snapshot) {
            return Text(
              'Olá, ${snapshot.data ?? "Explorador"}!',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white54),
            onPressed: () => context.read<app.AuthProvider>().logout(),
          ),
        ],
      ),
      body: postProvider.loading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFF750D8F)))
          : postProvider.error != null
              ? Center(
                  child: Text(postProvider.error!,
                      style: const TextStyle(color: Colors.white)))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: postProvider.posts.length,
                  itemBuilder: (_, index) {
                    final post = postProvider.posts[index];
                    return PostCard(
                      post: post,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PostDetailScreen()),
                      ),
                    );
                  },
                ),
    );
  }
}
