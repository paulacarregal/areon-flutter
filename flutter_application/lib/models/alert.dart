class Alert {
  final String titulo;
  final String descricao;
  final String nivel;
  final double latitude;
  final double longitude;
  final bool ativo;

  Alert({
    required this.titulo,
    required this.descricao,
    required this.nivel,
    required this.latitude,
    required this.longitude,
    required this.ativo,
  });

  factory Alert.fromMap(Map<String, dynamic> map) {
    return Alert(
      titulo: map['titulo'] ?? '',
      descricao: map['descricao'] ?? '',
      nivel: map['nivel'] ?? '',
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      ativo: map['ativo'] ?? false,
    );
  }
}