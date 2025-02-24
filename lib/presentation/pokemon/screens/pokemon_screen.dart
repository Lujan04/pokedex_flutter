import 'package:flutter/material.dart';
import 'package:pokedex_flutter/API/poke_api_service.dart';
import 'package:pokedex_flutter/pokemon.dart';
import 'package:pokedex_flutter/presentation/pokemon/widgets/evos_widget.dart';
import 'package:pokedex_flutter/presentation/pokemon/widgets/name_widget.dart';
import 'package:pokedex_flutter/presentation/pokemon/widgets/sprite_widget.dart';
import 'package:pokedex_flutter/presentation/pokemon/widgets/stats_widget.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late Future<Pokemon> futurePokemon;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final int pokemonId = ModalRoute.of(context)!.settings.arguments as int;
    futurePokemon = PokeApiService().fetchPokemon(pokemonId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        actions: [
          const Spacer(),
          const Text(
            "Flutter Pokédex",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Pok%C3%A9_Ball_icon.svg/640px-Pok%C3%A9_Ball_icon.svg.png",
            width: 50,
            height: 80,
          ),
          const Spacer(),
        ],
      ),
      body: FutureBuilder<Pokemon>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final pokemon = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        child: SpriteWidget(imageUrl: pokemon.sprite),
                      ),
                      NameWidget(
                        name: pokemon.name,
                        id: pokemon.id,
                        description: pokemon.description,
                      ),
                      StatsWidget(
                        types: pokemon.types,
                        height: pokemon.height,
                        weight: pokemon.weight,
                        abilities: pokemon.abilities,
                        stats: pokemon.stats,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
