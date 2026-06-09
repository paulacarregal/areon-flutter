import 'package:flutter/material.dart';

class AeonBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AeonBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFFFBFF31),
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,

      onTap: onTap,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Menu',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Mapa',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Review',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: 'Favoritos',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}