import 'package:flutter/material.dart';

// Page "à vous de coder" du support : Gallery, implémentée comme une grille
// d'icônes colorées (pas de dépendance réseau, contrairement à Meteo).
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  static const _icons = [
    Icons.image,
    Icons.landscape,
    Icons.pets,
    Icons.beach_access,
    Icons.forest,
    Icons.directions_car,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.deepOrange.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_icons[index], size: 40, color: Colors.deepOrange),
          );
        },
      ),
    );
  }
}
