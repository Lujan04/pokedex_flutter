import 'package:flutter/material.dart';

class PokeballCargando extends StatefulWidget {
  const PokeballCargando({super.key});

  @override
  State<PokeballCargando> createState() => _PokeballCargandoState();
}

class _PokeballCargandoState extends State<PokeballCargando>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Pok%C3%A9_Ball_icon.svg/640px-Pok%C3%A9_Ball_icon.svg.png",
        width: 100,
        height: 150,
      ),
    );
  }
}
