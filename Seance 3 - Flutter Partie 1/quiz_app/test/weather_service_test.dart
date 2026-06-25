import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/weather_service.dart';

void main() {
  test('geocodeCity resolves a real city to coordinates (live API call)', () async {
    final place = await geocodeCity('Casablanca');
    expect(place, isNotNull);
    expect(place!['name'], 'Casablanca');
    expect(place['latitude'], isA<double>());
    expect(place['longitude'], isA<double>());
  });

  test('geocodeCity returns null for a nonsense city name', () async {
    final place = await geocodeCity('zzzzznotacityxyz123');
    expect(place, isNull);
  });

  test('fetchHourlyForecast returns hourly temperature data (live API call)', () async {
    final forecast = await fetchHourlyForecast(33.5731, -7.5898); // Casablanca
    expect(forecast['time'], isNotEmpty);
    expect(forecast['temperature_2m'], isNotEmpty);
    expect(forecast['time']!.length, forecast['temperature_2m']!.length);
  });
}
