import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/pokemon.dart';

class PokeApiService {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  Future<Pokemon> fetchPokemon(int id) async {
    try {
      // Fetch Pokémon data
      final response = await http.get(Uri.parse('$baseUrl/pokemon/$id'));
      if (response.statusCode != 200) {
        throw Exception('Failed to load Pokémon data (ID: $id)');
      }
      final data = json.decode(response.body);

      // Fetch species data
      final speciesUrl = data['species']?['url'];
      if (speciesUrl == null) {
        throw Exception('Species URL is missing for Pokémon ID: $id');
      }

      final speciesResponse = await http.get(Uri.parse(speciesUrl));
      if (speciesResponse.statusCode != 200) {
        throw Exception('Failed to load species data for Pokémon ID: $id');
      }
      final speciesData = json.decode(speciesResponse.body);

      // Extract description
      final descriptionEntry = speciesData['flavor_text_entries']?.firstWhere(
        (entry) => entry['language']['name'] == 'en',
        orElse: () => null,
      );

      final description = descriptionEntry != null
          ? (descriptionEntry['flavor_text'] as String)
              .replaceAll('\n', ' ')
              .replaceAll('\f', ' ')
          : 'No description available';

      // Return Pokémon object
      return Pokemon.fromJson({
        ...data,
        'description': description,
      });
    } catch (e) {
      throw Exception('Error fetching Pokémon (ID: $id): $e');
    }
  }
}
