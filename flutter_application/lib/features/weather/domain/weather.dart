class Weather {
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String description;

  Weather({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}
