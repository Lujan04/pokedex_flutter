import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/API/poke_api_service.dart';
import 'package:pokedex_flutter/pokemon.dart';
import 'package:pokedex_flutter/presentation/pokedex/widgets/pokeballCargando.dart';
import 'package:pokedex_flutter/presentation/pokemon/widgets/name_widget.dart';
import 'package:pokedex_flutter/presentation/pokemon/widgets/sprite_widget.dart';
import 'package:pokedex_flutter/presentation/pokemon/widgets/stats_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late Future<Pokemon> futurePokemon;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final int pokemonId = ModalRoute.of(context)!.settings.arguments as int;
    futurePokemon = PokeApiService().fetchPokemon(pokemonId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          const Spacer(),
          Text(
            "Pokédex",
            style: GoogleFonts.orbitron(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
        ],
      ),
      body: FutureBuilder<Pokemon>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: PokeballCargando());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final pokemon = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        child: SpriteWidget(imageUrl: pokemon.sprite),
                      ),
                      NameWidget(
                        name: pokemon.name,
                        id: pokemon.id,
                        description: pokemon.description,
                      ),
                      StatsWidget(
                        types: pokemon.types,
                        height: pokemon.height,
                        weight: pokemon.weight,
                        abilities: pokemon.abilities,
                        stats: pokemon.stats,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final notificacionFavoritos = NotificacionFavoritos();
                          notificacionFavoritos.showNotification(
                            title: 'Pokémon Favorito',
                            body: '¡Has añadido un Pokémon a tus favoritos!',
                          );
                        },
                        child: const Text('Probar Notificación'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}

class NotificacionFavoritos {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificacionFavoritos() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'favorites_channel', // ID del canal
      'Favoritos', // Nombre del canal
      channelDescription: 'Notificaciones de Pokémon favoritos',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // ID de la notificación
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
