import 'package:http/http.dart' as http;
import 'dart:convert';

// Même logique réseau que Seance 3 (Open-Meteo, gratuit, sans clé), réutilisée
// ici pour la page "Meteo" de l'Application de Synthèse.
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

Future<Map<String, List<dynamic>>> fetchHourlyForecast(
    double lat, double lon) async {
  final forecastUrl =
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m&forecast_days=2';
  final forecastResp = await http.get(Uri.parse(forecastUrl));
  final forecastData = json.decode(forecastResp.body);
  return {
    'time': forecastData['hourly']['time'],
    'temperature_2m': forecastData['hourly']['temperature_2m'],
  };
}
