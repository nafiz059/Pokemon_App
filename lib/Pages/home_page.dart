import 'package:flutter/material.dart';
import 'package:pokemon_app/Data%20Source/pokemon_datasource.dart';

import '../widget/PokemonCard.dart';
import '../widget/my_title.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  List<Map?>? pokemondata = PokemonDatasource.pokemons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Pokemon App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Mytitle(text: "Pokedek", color: Colors.black),
            Expanded(
              flex: 12,
              child: SizedBox(
                height: 500.0,
                child: GridView.builder(
                  itemCount: pokemondata!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) => PokemonCard(
                    name: "${pokemondata![index]!["name"]}",
                    types: [
                      pokemondata![index]!.containsKey("type")
                          ? "${pokemondata![index]!["type"][0]}"
                          : "No Power"
                    ],
                    imageUrl: "${pokemondata![index]!["img"]}",
                    pokemonMap: pokemondata![index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
