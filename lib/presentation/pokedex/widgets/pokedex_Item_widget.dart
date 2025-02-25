import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pokemon.dart';

class PokedexItemWidget extends StatelessWidget {
  final Pokemon pokemon;

  const PokedexItemWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/pokemon',
          arguments: pokemon.id,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFF9C4), Color(0xFFFFF176)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.brown, width: 3),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(128, 128, 128, 0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Image.network(
                    pokemon.sprite,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  pokemon.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                const Spacer(),
                Text(
                  "#${pokemon.id.toString().padLeft(3, '0')}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
