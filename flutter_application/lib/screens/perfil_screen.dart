import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            SizedBox(height: 16),

            Text(
              "Explorador",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "usuario@email.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: AeonBottomBar(
        currentIndex: 4,

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
              Navigator.pushReplacementNamed(
                context,
                '/favoritos',
              );
              break;

            case 4:
              break;
          }
        },
      ),
    );
  }
}