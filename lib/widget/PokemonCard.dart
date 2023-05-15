import 'package:flutter/material.dart';
import 'package:pokemon_app/Pages/details_page.dart';

import 'PowerBadge.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final List<String> types;
  final String imageUrl;
  final Map? pokemonMap;
  const PokemonCard({
    required this.name,
    required this.types,
    required this.imageUrl,
    required this.pokemonMap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailsPage(data: pokemonMap)),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff49d0b1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  powerBadge(text: types[0]),
                  // powerBadge(text: types[1]),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Hero(
              tag: pokemonMap!["num"],
              child: Image.network(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
