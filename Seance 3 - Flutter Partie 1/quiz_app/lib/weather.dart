import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'weather_service.dart';

// Reproduit l'app "Weather" du support : saisie d'une ville, appel HTTP,
// affichage d'une liste de prévisions horaires.
//
// L'API utilisée dans le support (samples.openweathermap.org) n'est plus en
// ligne aujourd'hui : on utilise donc Open-Meteo (gratuit, sans clé d'API)
// en conservant la même logique (géocodage de la ville -> prévisions).
class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  TextEditingController cityEditingController = TextEditingController();
  List<dynamic>? hourlyTimes;
  List<dynamic>? hourlyTemps;
  String? cityName;
  String? errorMessage;
  bool loading = false;

  Future<void> getData(String city) async {
    setState(() {
      loading = true;
      errorMessage = null;
      hourlyTimes = null;
      hourlyTemps = null;
    });
    try {
      final place = await geocodeCity(city);
      if (place == null) {
        setState(() {
          loading = false;
          errorMessage = 'Ville introuvable';
        });
        return;
      }
      final forecast = await fetchHourlyForecast(place['latitude'], place['longitude']);
      setState(() {
        loading = false;
        cityName = place['name'];
        hourlyTimes = forecast['time'];
        hourlyTemps = forecast['temperature_2m'];
      });
    } catch (err) {
      setState(() {
        loading = false;
        errorMessage = 'Erreur de connexion';
      });
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cityEditingController,
                    decoration: InputDecoration(hintText: 'Tape une ville...'),
                    onSubmitted: (value) => getData(value),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.deepOrangeAccent),
                  onPressed: () => getData(cityEditingController.text),
                )
              ],
            ),
          ),
          if (loading) Padding(padding: const EdgeInsets.all(20), child: CircularProgressIndicator()),
          if (errorMessage != null) Text(errorMessage!, style: TextStyle(color: Colors.red)),
          if (hourlyTimes != null)
            Expanded(
              child: ListView.builder(
                itemCount: hourlyTimes!.length,
                itemBuilder: (context, index) {
                  final dt = DateTime.parse(hourlyTimes![index]);
                  return Card(
                    color: Colors.deepOrangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('E dd/MM HH:mm').format(dt),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${hourlyTemps![index]} °C',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
