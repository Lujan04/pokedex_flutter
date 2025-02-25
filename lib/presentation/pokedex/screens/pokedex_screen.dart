import 'package:flutter/material.dart';
import 'package:pokedex_flutter/API/poke_api_service.dart';
import 'package:pokedex_flutter/pokemon.dart';
import 'package:pokedex_flutter/presentation/pokedex/widgets/pokedex_item_widget.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final PokeApiService apiService = PokeApiService();
  List<Pokemon> pokemonList = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchPokemonList();
  }

  Future<void> _fetchPokemonList() async {
    try {
      List<Pokemon> fetchedPokemon = [];
      for (int i = 1; i <= 151; i++) {
        final pokemon = await apiService.fetchPokemon(i);
        fetchedPokemon.add(pokemon);
        print('Fetched Pokémon: ${pokemon.name}');
      }
      setState(() {
        pokemonList = fetchedPokemon;
        isLoading = false;
      });
      print('Pokémon list loaded successfully');
    } catch (e) {
      setState(() {
        errorMessage = 'Error al cargar la Pokédex: $e';
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
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
            Expanded(
              child: isLoading
                  ? Center(
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Pok%C3%A9_Ball_icon.svg/640px-Pok%C3%A9_Ball_icon.svg.png",
                        width: 50,
                        height: 80,
                      ),
                    )
                  : errorMessage.isNotEmpty
                      ? Center(child: Text(errorMessage))
                      : ListView.builder(
                          itemCount: pokemonList.length,
                          itemBuilder: (context, index) {
                            return PokedexItemWidget(
                              pokemon: pokemonList[index],
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
