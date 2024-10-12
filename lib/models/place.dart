class Place {
  final String name;

  const Place({
    required this.name,
  });

  factory Place.fromJson(Map<String, dynamic> data) {
    return Place(
      name: data['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
