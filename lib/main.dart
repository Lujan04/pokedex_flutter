import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pokedex_flutter/presentation/pokedex/screens/pokedex_screen.dart';
import 'package:pokedex_flutter/presentation/pokemon/screens/pokemon_screen.dart';
import 'package:pokedex_flutter/theme/themeData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Crear un canal de notificaciones
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'favorites_channel', // ID del canal
    'Favoritos', // Nombre del canal
    description: 'Notificaciones de Pokémon favoritos',
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex Flutter',
      theme: isDarkMode ? darkmode : lightMode,
      initialRoute: '/',
      routes: {
        '/': (context) => PokedexScreen(toggleTheme: toggleTheme),
        '/pokemon': (context) => const PokemonScreen(),
      },
    );
  }
}
