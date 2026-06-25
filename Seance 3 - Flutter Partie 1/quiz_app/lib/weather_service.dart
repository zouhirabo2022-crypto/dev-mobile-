import 'package:http/http.dart' as http;
import 'dart:convert';

/// Géocode le nom d'une ville en coordonnées (latitude/longitude) via l'API
/// gratuite Open-Meteo (sans clé). Retourne null si la ville est introuvable.
Future<Map<String, dynamic>?> geocodeCity(String city) async {
  final geoUrl =
      'https://geocoding-api.open-meteo.com/v1/search?name=${Uri.encodeQueryComponent(city)}&count=1';
  final geoResp = await http.get(Uri.parse(geoUrl));
  final geoData = json.decode(geoResp.body);
  if (geoData['results'] == null || geoData['results'].isEmpty) {
    return null;
  }
  return geoData['results'][0];
}

/// Récupère les prévisions horaires de température pour une position donnée.
Future<Map<String, List<dynamic>>> fetchHourlyForecast(double lat, double lon) async {
  final forecastUrl =
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m&forecast_days=2';
  final forecastResp = await http.get(Uri.parse(forecastUrl));
  final forecastData = json.decode(forecastResp.body);
  return {
    'time': forecastData['hourly']['time'],
    'temperature_2m': forecastData['hourly']['temperature_2m'],
  };
}
