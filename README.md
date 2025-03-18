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
## `lib/`
- **`main.dart`**: Punto de entrada.
- **`Pokemon.dart`**: Clase y métodos de Pokémon.

### `Notifications/`
- **`favoritePokemon.dart`**: Notificaciones de favoritos.

### `API/`
- **`poke_api_service.dart`**: Peticiones a la PokeAPI.

### `Presentation/`

#### `Pokedex/`
- **`Screens/`**
  - **`pokedex_screen.dart`**: Pantalla principal de la Pokédex.
- **`Widgets/`**
  - **`pokedex_item.dart`**: Pokémon en la lista.
  - **`barraBusqueda.dart`**: Barra de búsqueda.
  - **`pokeballCargando.dart`**: Widget de carga.
  - **`tipoFiltro.dart`**: Filtro por tipo.

#### `Pokemon/`
- **`Screens/`**
  - **`pokemon_screen.dart`**: Detalles del Pokémon.
- **`Widgets/`**
  - **`evos_widget.dart`**: Evoluciones.
  - **`name_widget.dart`**: Nombre.
  - **`stats_widget.dart`**: Estadísticas.
  - **`sprite_widget.dart`**: Sprite.


