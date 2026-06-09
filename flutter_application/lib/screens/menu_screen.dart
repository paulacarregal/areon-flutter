import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../repositories/post_repository.dart';
import '../widgets/post_card.dart';
import '../widgets/bottom_bar.dart';


class MenuScreen extends StatelessWidget {

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final posts = getAllPosts();

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,

        title: const Text(
          "Olá, Explorador!",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        
        ),
      
      ),

      body: Container(
        decoration: const BoxDecoration(
          color: backgroundAeon,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),

        child: ListView.builder(
          itemCount: posts.length,

          itemBuilder: (context, index) {

            return PostCard(
              post: posts[index],
            );
          },
        ),
      ),
      bottomNavigationBar: AeonBottomBar(
        currentIndex: 0,

        onTap: (index) {
          switch (index) {
            case 0:
              break;

            case 1:
              Navigator.pushNamed(
                context,
                '/mapa',
              );
              break;

            case 2:
              Navigator.pushNamed(
                context,
                '/review',
              );
              break;

            case 3:
              Navigator.pushNamed(
                context,
                '/favoritos',
              );
              break;

            case 4:
              Navigator.pushNamed(
                context,
                '/perfil',
              );
              break;
          }
        },
      ),
    );
  }
}