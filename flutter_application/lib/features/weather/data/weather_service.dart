import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/app_config.dart';
import '../../../core/observability/logging_service.dart';
import '../../../core/observability/metrics_service.dart';
import '../domain/weather.dart';

class WeatherService {
  Future<Weather> getWeather({String city = AppConfig.defaultCity}) async {
    final key = AppConfig.openWeatherKey;
    log.info('Weather', 'getWeather', extra: {'city': city});
    metrics.increment('aeon.weather.api.calls');

    if (key.isEmpty) {
      log.warn('Weather', 'no API key configured — returning placeholder');
      return Weather(
        temperature: 25.0,
        humidity: 60,
        windSpeed: 3.5,
        description: 'Parcialmente nublado',
      );
    }

    final url = Uri.parse(
      '${AppConfig.openWeatherBaseUrl}/weather'
      '?q=${Uri.encodeComponent(city)}'
      '&units=metric&lang=pt_br&appid=$key',
    );

    final sw = Stopwatch()..start();
    try {
      final response = await http.get(url);
      sw.stop();
      metrics.timing('aeon.weather.api.duration_ms', sw.elapsed);
      metrics.gauge('aeon.weather.api.status_code', response.statusCode);

      if (response.statusCode == 200) {
        final weather =
            Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        log.info('Weather', 'fetched OK',
            extra: {'city': city, 'temp': weather.temperature});
        return weather;
      }

      metrics.increment('aeon.weather.api.errors');
      log.error('Weather', 'bad status',
          extra: {'status': response.statusCode, 'city': city});
      throw Exception('Erro ao carregar clima (${response.statusCode})');
    } catch (e, st) {
      if (sw.isRunning) sw.stop();
      metrics.increment('aeon.weather.api.errors');
      log.error('Weather', 'request failed',
          error: e, stack: st, extra: {'city': city});
      rethrow;
    }
  }
}
