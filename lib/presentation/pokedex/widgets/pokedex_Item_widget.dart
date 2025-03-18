import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/pokemon.dart';
import 'package:pokedex_flutter/notifications/favoritePokemon.dart';

class PokedexItemWidget extends StatefulWidget {
  final Pokemon pokemon;
  final bool isList;

  const PokedexItemWidget({
    super.key,
    required this.pokemon,
    required this.isList,
  });

  @override
  State<PokedexItemWidget> createState() => _PokedexItemWidgetState();
}

class _PokedexItemWidgetState extends State<PokedexItemWidget> {
  final NotificacionFavoritos notificacionFavoritos =
      NotificacionFavoritos(FlutterLocalNotificationsPlugin());

  Color pickColor() {
    switch (widget.pokemon.types[0].toLowerCase()) {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/pokemon',
          arguments: widget.pokemon.id,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: pickColor(),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(128, 128, 128, 0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: widget.isList
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        child: Image.network(
                          widget.pokemon.sprite,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, color: Colors.red);
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.pokemon.name.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              setState(() {
                                widget.pokemon.isFavorite =
                                    !widget.pokemon.isFavorite;
                              });

                              if (widget.pokemon.isFavorite) {
                                await notificacionFavoritos.showNotification(
                                  title: 'Pokémon Favorito',
                                  body:
                                      '${widget.pokemon.name} ahora está entre tus favoritos.',
                                );
                              }
                            },
                            icon: Icon(
                              widget.pokemon.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "#${widget.pokemon.id.toString().padLeft(3, '0')}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                      child: Image.network(
                        widget.pokemon.sprite,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error, color: Colors.red);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.pokemon.name.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              widget.pokemon.isFavorite =
                                  !widget.pokemon.isFavorite;
                            });

                            if (widget.pokemon.isFavorite) {
                              await notificacionFavoritos.showNotification(
                                title: 'Pokémon Favorito',
                                body:
                                    '${widget.pokemon.name} ahora está entre tus favoritos.',
                              );
                            }
                          },
                          icon: Icon(
                            widget.pokemon.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "#${widget.pokemon.id.toString().padLeft(3, '0')}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
