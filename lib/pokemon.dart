class Pokemon {
  final int id;
  final String name;
  final String description;
  final List<String> types;
  final double height;
  final double weight;
  final List<String> abilities;
  final Map<String, int> stats;
  final String sprite;
  bool isFavorite = false;

  Pokemon({
    required this.id,
    required this.name,
    required this.description,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    required this.sprite,
    this.isFavorite = false,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      description: "",
      types:
          List<String>.from(json['types'].map((type) => type['type']['name'])),
      height: json['height'] / 10.0,
      weight: json['weight'] / 10.0,
      abilities: List<String>.from(
          json['abilities'].map((ability) => ability['ability']['name'])),
      stats: Map<String, int>.fromEntries(
        json['stats'].map<MapEntry<String, int>>(
          (stat) =>
              MapEntry<String, int>(stat['stat']['name'], stat['base_stat']),
        ),
      ),
      sprite: json['sprites']['front_default'] ?? "",
    );
  }
}
