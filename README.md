# Pokedex Flutter

Pokedex Flutter es una aplicación móvil desarrollada en Flutter que actúa como una Pokédex interactiva para los Pokémon de la primera generación. La aplicación obtiene los datos de una API de Pokémon y los presenta de manera visualmente atractiva y fácil de navegar.

## Características

- Visualiza una lista de todos los Pokémon de la primera generación junto con sus imágenes.
- Detalles de cada Pokémon, incluidos sus stats, habilidades, y más.
- Gráficos interactivos que muestran las estadísticas del Pokémon.
- Información sobre cada Pokémon, como su ID, altura, peso y tipos.

## Paquetes Utilizados

Este proyecto hace uso de los siguientes paquetes de pub.dev:

- **http**: Para hacer peticiones HTTP a la PokeAPI.
- **cached_network_image**: Para cargar y almacenar imágenes de manera eficiente con caché.
- **fl_chart**: Para crear gráficos visuales que muestran las estadísticas de los Pokémon.
- **intl**: Para manejar la internacionalización y localización de la aplicación.

## Estructura del Proyecto

El proyecto tiene la siguiente estructura de directorios:

- **lib/**: Contiene el código principal de la aplicación.
  - **main.dart**: El punto de entrada de la aplicación.
  - **Pokemon.dart**: Define la clase y los métodos relacionados con los Pokémon.
  - **API/**: Contiene los servicios de API.
    - **poke_api_service.dart**: Maneja las peticiones a la PokeAPI.
  - **Presentation/**: Contiene la lógica de presentación de la aplicación.
    - **Pokedex/**: Contiene las pantallas y widgets relacionados con la Pokédex.
      - **Screens/**: Contiene las pantallas de la Pokédex.
        - **pokedex_screen.dart**: Pantalla principal de la Pokédex.
      - **Widgets/**: Contiene los widgets de la Pokédex.
        - **pokedex_item.dart**: Widget para mostrar un Pokémon en la lista.
    - **Pokemon/**: Contiene las pantallas y widgets relacionados con los detalles de los Pokémon.
      - **Screens/**: Contiene las pantallas de detalles de los Pokémon.
        - **pokemon_screen.dart**: Pantalla de detalles de un Pokémon.
      - **Widgets/**: Contiene los widgets de detalles de los Pokémon.
        - **evos_widget.dart**: Widget para mostrar las evoluciones de un Pokémon.
        - **name_widget.dart**: Widget para mostrar el nombre de un Pokémon.
        - **stats_widget.dart**: Widget para mostrar las estadísticas de un Pokémon.
        - **sprite_widget.dart**: Widget para mostrar el sprite de un Pokémon.
