import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/presentation/pokedex/widgets/pokeballCargando.dart';

class SpriteWidget extends StatelessWidget {
  final String imageUrl;

  const SpriteWidget({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(color: Theme.of(context).colorScheme.secondary,  width: 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const[
          BoxShadow(
            color: Colors.black,
            spreadRadius: 3,
            blurRadius: 10,
            offset:  Offset(0, 3)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain, 
            placeholder: (context, url) => const Center( child: 
                     PokeballCargando()
                    ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.broken_image,
                size: 50,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
