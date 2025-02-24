import 'package:flutter/material.dart';
import 'package:pokedex_flutter/presentation/pokedex/screens/pokedex_screen.dart';
import 'package:pokedex_flutter/presentation/pokedex/widgets/pokedex_item_widget.dart';
import 'package:pokedex_flutter/presentation/pokemon/screens/pokemon_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => const PokedexScreen(),
        '/pokemon': (context) => const PokemonScreen(), 
        
      },
    );
  }
}
