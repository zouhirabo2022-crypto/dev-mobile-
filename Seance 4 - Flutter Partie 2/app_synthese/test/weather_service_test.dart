import 'package:flutter_test/flutter_test.dart';
import 'package:app_synthese/services/weather_service.dart';

// Tests réseau réels (exécutés sur l'hôte, qui a Internet) car l'émulateur
// Android de cette machine n'a pas de route réseau par défaut (voir README).
void main() {
  test('geocodeCity résout une vraie ville (appel API réel)', () async {
    final place = await geocodeCity('Casablanca');
    expect(place, isNotNull);
    expect(place!['name'], 'Casablanca');
  });

  test('fetchHourlyForecast retourne des prévisions horaires (appel API réel)',
      () async {
    final forecast = await fetchHourlyForecast(33.5731, -7.5898);
    expect(forecast['time'], isNotEmpty);
    expect(forecast['temperature_2m'], isNotEmpty);
  });
}
