# Pokedex Flutter

Pokedex Flutter es una aplicación móvil desarrollada en Flutter que actúa como una Pokédex interactiva. La aplicación consume datos de la [PokeAPI](https://pokeapi.co/) para mostrar información detallada y visualmente atractiva sobre los Pokémon.

## Características

- **Lista de Pokémon**: Visualiza todos los Pokémon con imágenes, alternando entre formato lista o cuadrícula.
- **Detalles de Pokémon**: Consulta estadísticas, habilidades, altura, peso, tipos y más.
- **Gráficos interactivos**: Visualiza las estadísticas de los Pokémon mediante gráficos.
- **Pokémon aleatorio**: Muestra los detalles de un Pokémon seleccionado al azar.
- **Tema claro y oscuro**: Cambia entre modos de visualización.
- **Favoritos**: Marca tus Pokémon favoritos y recibe notificaciones al añadirlos.
- **Orden y filtro**: Ordena por nombre o número en la Pokédex y filtra por tipo.

## Paquetes Utilizados

El proyecto utiliza los siguientes paquetes de [pub.dev](https://pub.dev):

- **[http](https://pub.dev/packages/http)**: Para realizar peticiones HTTP a la PokeAPI.
- **[cached_network_image](https://pub.dev/packages/cached_network_image)**: Para cargar y almacenar imágenes con caché.
- **[syncfusion_flutter_charts](https://pub.dev/packages/syncfusion_flutter_charts)**: Para crear gráficos interactivos.
- **[google_fonts](https://pub.dev/packages/google_fonts)**: Para añadir fuentes personalizadas.
- **[flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)**: Para mostrar notificaciones al añadir Pokémon como favoritos.

## Estructura del Proyecto

El proyecto está organizado de la siguiente manera:
lib/ ├── main.dart # Punto de entrada de la aplicación. ├── Pokemon.dart # Clase y métodos relacionados con los Pokémon. ├── Notifications/ # Servicios de notificaciones. │ └── favoritePokemon.dart # Notificaciones al añadir Pokémon favoritos. ├── API/ # Servicios de API. │ └── poke_api_service.dart # Peticiones a la PokeAPI. ├── Presentation/ # Lógica de presentación. │ ├── Pokedex/ # Pantallas y widgets de la Pokédex. │ │ ├── Screens/ # Pantallas relacionadas con la Pokédex. │ │ │ └── pokedex_screen.dart # Pantalla principal de la Pokédex. │ │ └── Widgets/ # Widgets relacionados con la Pokédex. │ │ ├── pokedex_item.dart # Widget para mostrar un Pokémon en la lista. │ │ ├── barraBusqueda.dart # Widget para buscar Pokémon. │ │ ├── pokeballCargando.dart # Widget de carga. │ │ └── tipoFiltro.dart # Widget para filtrar Pokémon por tipo. │ ├── Pokemon/ # Pantallas y widgets de detalles de Pokémon. │ │ ├── Screens/ # Pantallas relacionadas con los detalles de los Pokémon. │ │ │ └── pokemon_screen.dart # Pantalla de detalles de un Pokémon. │ │ └── Widgets/ # Widgets para mostrar detalles de Pokémon. │ │ ├── evos_widget.dart # Widget para mostrar evoluciones. │ │ ├── name_widget.dart # Widget para mostrar el nombre. │ │ ├── stats_widget.dart # Widget para mostrar estadísticas. │ │ └── sprite_widget.dart # Widget para mostrar el sprite.

