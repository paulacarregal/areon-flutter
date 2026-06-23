import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../map/presentation/place_provider.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/widgets/favorite_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final places = context.watch<PlaceProvider>().places;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Favoritos',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: places.isEmpty
          ? const Center(child: Text('Nenhum favorito ainda.'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: places.length,
              separatorBuilder: (context, i) => const SizedBox(height: 16),
              itemBuilder: (_, index) {
                final place = places[index];
                return FavoriteCard(
                  nome: place.name,
                  rating: place.rating,
                  reviews: 0,
                  preco: place.priceRange,
                  horario: place.horario,
                  image: place.image,
                );
              },
            ),
    );
  }
}
