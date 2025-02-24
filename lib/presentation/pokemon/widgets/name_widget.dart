import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  final String name;
  final int id;
  final String description;

  const NameWidget({
    Key? key,
    required this.name,
    required this.id,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "#${id.toString().padLeft(3, '0')}",
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
