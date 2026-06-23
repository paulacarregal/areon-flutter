import 'package:flutter/material.dart';

import '../../feed/presentation/menu_screen.dart';
import '../../map/presentation/maps_screen.dart';
import '../../profile/presentation/perfil_screen.dart';
import './review_screen.dart';
import './favoritos_screen.dart';
import '../../../shared/widgets/bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final _screens = const [
    MenuScreen(),
    MapsScreen(),
    ReviewScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
