import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),

      body: const Center(
        child: Text(
          "Seus Favoritos",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      bottomNavigationBar: AeonBottomBar(
        currentIndex: 3,

        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(
                context,
                '/menu',
              );
              break;

            case 1:
              Navigator.pushReplacementNamed(
                context,
                '/mapa',
              );
              break;

            case 2:
              Navigator.pushReplacementNamed(
                context,
                '/review',
              );
              break;

            case 3:
              break;

            case 4:
              Navigator.pushReplacementNamed(
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