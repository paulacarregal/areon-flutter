class Place {
  final String id;
  final String name;
  final double rating;
  final String priceRange;
  final String horario;
  final String distancia;
  final String image;
  final double latitude;
  final double longitude;

  Place({
    this.id = '',
    required this.name,
    required this.rating,
    required this.priceRange,
    required this.horario,
    required this.distancia,
    required this.image,
    required this.latitude,
    required this.longitude,
  });

  factory Place.fromMap(String id, Map<String, dynamic> map) {
    return Place(
      id: id,
      name: map['name'] as String? ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      priceRange: map['priceRange'] as String? ?? '',
      horario: map['horario'] as String? ?? '',
      distancia: map['distancia'] as String? ?? '',
      image: map['image'] as String? ?? '',
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rating': rating,
      'priceRange': priceRange,
      'horario': horario,
      'distancia': distancia,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
