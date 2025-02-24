import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SpriteWidget extends StatelessWidget {
  final String imageUrl;

  const SpriteWidget({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AspectRatio(
          aspectRatio:
              1, // Mantiene el cuadrado sin importar el tamaño de la pantalla
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain, // Evita distorsión
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
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
