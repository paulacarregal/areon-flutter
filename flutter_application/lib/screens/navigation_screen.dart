import 'package:flutter/material.dart';

import 'menu_screen.dart';
import 'maps_screen.dart';
import 'favoritos_screen.dart';
import 'perfil_screen.dart';
import 'review_screen.dart';

import '../widgets/bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() =>
      _NavigationScreenState();
}

class _NavigationScreenState
    extends State<NavigationScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [
    const MenuScreen(),      // índice 0
    const MapsScreen(),      // índice 1
    const ReviewScreen(),    // índice 2
    const FavoritosScreen(), // índice 3
    const PerfilScreen(),    // índice 4
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: AeonBottomBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}