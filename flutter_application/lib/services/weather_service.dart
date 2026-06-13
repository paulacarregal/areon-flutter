import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather.dart';

class WeatherService {

  String get apiKey => dotenv.env['OPENWEATHER_KEY'] ?? '';

  Future<Weather> getWeather() async {

    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=Sao%20Paulo&units=metric&lang=pt_br&appid=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    }

    throw Exception('Erro ao carregar clima');
  }
}
