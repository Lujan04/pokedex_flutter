import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/API/poke_api_service.dart';
import 'package:pokedex_flutter/pokemon.dart';
import 'package:pokedex_flutter/presentation/pokedex/widgets/barraBusqueda.dart';
import 'package:pokedex_flutter/presentation/pokedex/widgets/pokeballCargando.dart';
import 'package:pokedex_flutter/presentation/pokedex/widgets/pokedex_item_widget.dart';
import 'package:pokedex_flutter/presentation/pokedex/widgets/tipoFiltro.dart';

class PokedexScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const PokedexScreen({super.key, required this.toggleTheme});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final PokeApiService apiService = PokeApiService();
  List<Pokemon> pokemonList = [];
  List<Pokemon> filteredPokemonList = [];
  bool isLoading = true;
  String errorMessage = '';
  bool isList = false;
  bool sortNumber = true;

  @override
  void initState() {
    super.initState();
    _fetchPokemonList();
  }

  void handleViewChange() {
    setState(() {
      isList = !isList;
    });
  }

  Future<List<Pokemon>> pokemonListDef = Future.value([]);
  Future<void> _fetchPokemonList() async {
    try {
      setState(() {
        isLoading = true;
      });

      final List<Future<Pokemon>> fetchTasks = [
        for (int i = 1; i <= 1024; i++) apiService.fetchPokemon(i)
      ];

      final List<Pokemon> fetchedPokemon = await Future.wait(fetchTasks);

      setState(() {
        pokemonList = fetchedPokemon;
        filteredPokemonList = fetchedPokemon;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error al cargar la Pokédex: $e';
      });
    }
  }

  void _filterPokemon(String query) {
    setState(() {
      filteredPokemonList = pokemonList
          .where((pokemon) =>
              pokemon.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _filterPokemonTipo(String tipo) {
    setState(() {
      filteredPokemonList = pokemonList
          .where((pokemon) =>
              pokemon.types.any((t) => t.toLowerCase() == tipo.toLowerCase()))
          .toList();
    });
  }

  void _filterFavorites() {
    setState(() {
      filteredPokemonList =
          pokemonList.where((pokemon) => pokemon.isFavorite).toList();
    });
  }

  void randomPokemon(List<Pokemon> pokemonList) {
    final random = Random();
    final randomPokemon = pokemonList[random.nextInt(pokemonList.length)];
    Navigator.pushNamed(context, '/pokemon', arguments: randomPokemon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              actions: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      filteredPokemonList = List.from(pokemonList);
                    });
                  },
                  child: Text(
                    "Pokédex",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: handleViewChange,
                  icon: Icon(
                    isList ? Icons.grid_view : Icons.view_list,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: widget.toggleTheme,
                  icon: Icon(
                    Icons.brightness_6,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: _filterFavorites,
                  icon: Icon(
                    Icons.favorite,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    randomPokemon(pokemonList);
                  },
                  icon: Icon(
                    Icons.question_mark,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    sortNumber = !sortNumber;
                    setState(() {
                      if (sortNumber) {
                        filteredPokemonList
                            .sort((a, b) => a.id.compareTo(b.id));
                      } else {
                        filteredPokemonList.sort((a, b) => a.name
                            .toLowerCase()
                            .compareTo(b.name.toLowerCase()));
                      }
                    });
                  },
                  icon: Icon(
                    sortNumber
                        ? Icons.format_list_numbered_rounded
                        : Icons.sort_by_alpha_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BarraBusqueda(
                onChanged: _filterPokemon,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Tipofiltro(
                    onTap: (tipo) => _filterPokemonTipo(tipo),
                  ),
                )),
            Expanded(
              child: isLoading
                  ? const Center(child: PokeballCargando())
                  : errorMessage.isNotEmpty
                      ? Center(child: Text(errorMessage))
                      : isList
                          ? ListView.builder(
                              itemCount: filteredPokemonList.length,
                              itemBuilder: (context, index) {
                                return PokedexItemWidget(
                                  pokemon: filteredPokemonList[index],
                                  isList: isList,
                                );
                              },
                            )
                          : GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                              children: [
                                for (final pokemon in filteredPokemonList)
                                  PokedexItemWidget(
                                    pokemon: pokemon,
                                    isList: isList,
                                  )
                              ],
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
