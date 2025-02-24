import 'package:flutter/material.dart';

class EvosWidget extends StatelessWidget {
  final List<String> evolutions;

  const EvosWidget({Key? key, required this.evolutions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFF9C4), Color(0xFFFFF176)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.brown, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Evoluciones",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              evolutions.isNotEmpty
                  ? Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: evolutions
                          .map((evo) => Chip(
                                label: Text(
                                  evo,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                backgroundColor: Colors.yellow[100],
                              ))
                          .toList(),
                    )
                  : const Text(
                      "No hay evoluciones disponibles",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
