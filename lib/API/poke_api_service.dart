import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/pokemon.dart';

class PokeApiService {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  Future<Pokemon> fetchPokemon(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/pokemon/$id'));
      if (response.statusCode != 200) {
        throw Exception('Failed to load Pokémon data');
      }
      final data = json.decode(response.body);

      final speciesResponse = await http.get(Uri.parse(data['species']['url']));
      if (speciesResponse.statusCode != 200) {
        throw Exception('Failed to load Pokémon species data');
      }
      final speciesData = json.decode(speciesResponse.body);

      final descriptionEntry = speciesData['flavor_text_entries'].firstWhere(
        (entry) => entry['language']['name'] == 'en',
        orElse: () => {'flavor_text': 'No description available'},
      );
      final description = (descriptionEntry['flavor_text'] as String)
          .replaceAll('\n', ' ')
          .replaceAll('\f', ' ');

      final evolutionChainResponse =
          await http.get(Uri.parse(speciesData['evolution_chain']['url']));
      if (evolutionChainResponse.statusCode != 200) {
        throw Exception('Failed to load evolution chain');
      }
      final evolutionChainData = json.decode(evolutionChainResponse.body);
      final evolutions = _getEvolutions(evolutionChainData['chain']);

      return Pokemon.fromJson({
        ...data,
        'description': description,
        'evolutions': evolutions,
      });
    } catch (e) {
      throw Exception('Error fetching Pokémon: $e');
    }
  }

  List<String> _getEvolutions(Map<String, dynamic> chain) {
    List<String> evolutions = [];

    void traverseChain(Map<String, dynamic> node) {
      evolutions.add(node['species']['name']);
      for (var next in node['evolves_to']) {
        traverseChain(next);
      }
    }

    traverseChain(chain);
    return evolutions;
  }
}
