import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
      ),

      body: const Center(
        child: Text(
          "Mapa",
          style: TextStyle(fontSize: 22),
        ),
      ),

      bottomNavigationBar: AeonBottomBar(
        currentIndex: 1,

        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(
                context,
                '/menu',
              );
              break;

            case 1:
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