import 'package:flutter/material.dart';
import '../widgets/favorite_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF5),

      appBar: AppBar(
        title: const Text("Favoritos"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: const [

          FavoriteCard(
            nome: "Terraço Jardins",
            rating: 5.0,
            reviews: 1000,
            preco: "R\$ 200-250",
            horario: "14:00",
            image: 'assets/images/places/terraco_jardins_1.jpg',

            
          ),

          SizedBox(height: 16),

          FavoriteCard(
            nome: "Big Kahuna Burger",
            rating: 4.5,
            reviews: 150,
            preco: "R\$ 50-55",
            horario: "14:00",
            image: 'assets/images/places/big_kahuna_1.jpg',
          ),

          SizedBox(height: 16),

          FavoriteCard(
            nome: "Exposição MIS",
            rating: 4.2,
            reviews: 500,
            preco: "R\$ 20-25",
            horario: "14:00",
            image: 'assets/images/places/exposição_mis_1.jpg',
          ),
          
        ],
      ),
    );
  }
}