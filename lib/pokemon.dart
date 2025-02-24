class Pokemon {
  final int id;
  final String name;
  final String description;
  final List<String> types;
  final double height;
  final double weight;
  final List<String> abilities;
  final Map<String, int> stats;
  final List<String> evolutions;
  final String sprite;

  Pokemon({
    required this.id,
    required this.name,
    required this.description,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    required this.evolutions,
    required this.sprite,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      description: "", // Se llenará con otra petición a species/{id}
      types:
          List<String>.from(json['types'].map((type) => type['type']['name'])),
      height: json['height'] / 10.0, // Convertir a metros
      weight: json['weight'] / 10.0, // Convertir a kilogramos
      abilities: List<String>.from(
          json['abilities'].map((ability) => ability['ability']['name'])),
      stats: Map<String, int>.fromEntries(
        json['stats'].map<MapEntry<String, int>>(
          (stat) =>
              MapEntry<String, int>(stat['stat']['name'], stat['base_stat']),
        ),
      ),
      evolutions: [], // Se llenará después
      sprite: json['sprites']['front_default'] ?? "",
    );
  }
}
