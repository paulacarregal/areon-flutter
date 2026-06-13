import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/post_card.dart';
import '../repositories/post_repository.dart';
import '../screens/post_detail_screen.dart';


class MenuScreen extends StatelessWidget {

  const MenuScreen({super.key});

  Future<String> getNomeUsuario() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return 'Explorador';
      }

      final document = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!document.exists) {
        return 'Explorador';
      }

      return document.data()?['nome'] ?? 'Explorador';
    } catch (_) {
      return 'Explorador';
    }
  }

  @override

  Widget build(BuildContext context) {

    final posts = getAllPosts();

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,

        title: FutureBuilder<String>(
          future: getNomeUsuario(),
          builder: (context, snapshot) {
            return Text(
              'Olá, ${snapshot.data ?? "Explorador"}!',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            );
          },
        ),

      ),

      body: Container(
        color: Colors.black,

        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: posts.length,
          itemBuilder: (_, index) {
            
            final post = posts[index];

              return PostCard(
                post: post,
                onTap: () {
                  if (post.nome == "Blair Willows") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const PostDetailScreen(),
                      ),
                    );
                  }
                },
              );
          },
        ),
      ),

    );
  }
}

