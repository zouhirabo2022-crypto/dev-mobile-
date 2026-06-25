import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_synthese/services/weather_service.dart';

// Page "à vous de coder" du support : Meteo, implémentée avec une vraie API
// (Open-Meteo) selon le même schéma que l'onglet Weather de la Séance 3.
class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});

  @override
  State<MeteoPage> createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  final cityController = TextEditingController();
  List<dynamic>? hourlyTimes;
  List<dynamic>? hourlyTemps;
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
      final forecast =
          await fetchHourlyForecast(place['latitude'], place['longitude']);
      setState(() {
        loading = false;
        hourlyTimes = forecast['time'];
        hourlyTemps = forecast['temperature_2m'];
      });
    } catch (err) {
      setState(() {
        loading = false;
        errorMessage = 'Erreur de connexion';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meteo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cityController,
                    decoration: const InputDecoration(hintText: 'Tape une ville...'),
                    onSubmitted: (value) => getData(value),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.deepOrange),
                  onPressed: () => getData(cityController.text),
                ),
              ],
            ),
          ),
          if (loading) const CircularProgressIndicator(),
          if (errorMessage != null)
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),
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
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${hourlyTemps![index]} °C',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          else if (!loading && errorMessage == null)
            const Expanded(
              child: Center(child: Text('Meteo ..', style: TextStyle(fontSize: 22, color: Colors.deepOrange))),
            ),
        ],
      ),
    );
  }
}
