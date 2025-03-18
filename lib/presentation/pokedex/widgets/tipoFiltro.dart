import 'package:flutter/material.dart';

class Tipofiltro extends StatefulWidget {
  final Function(String)? onTap;

  const Tipofiltro({Key? key, this.onTap}) : super(key: key);

  @override
  State<Tipofiltro> createState() => _TipofiltroState();
}

class _TipofiltroState extends State<Tipofiltro> {
  @override
  Widget build(BuildContext context) {
    List<String> types = [
      'normal',
      'fire',
      'water',
      'grass',
      'electric',
      'ice',
      'fighting',
      'poison',
      'ground',
      'flying',
      'psychic',
      'bug',
      'rock',
      'ghost',
      'dragon',
      'dark',
      'steel',
      'fairy'
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(types.length, (index) {
        return GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!(types[index]);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: pickColor(types[index]),
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    types[index],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Color pickColor(String type) {
    switch (type) {
      case 'normal':
        return Colors.grey;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.yellow;
      case 'ice':
        return Colors.cyan;
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.brown;
      case 'flying':
        return Colors.lightBlue;
      case 'psychic':
        return Colors.pink;
      case 'bug':
        return Colors.lightGreen;
      case 'rock':
        return Colors.lime;
      case 'ghost':
        return Colors.deepPurple;
      case 'dragon':
        return Colors.indigo;
      case 'dark':
        return Colors.black;
      case 'steel':
        return Colors.blueGrey;
      case 'fairy':
        return Colors.pinkAccent;
      default:
        return Colors.grey;
    }
  }
}
