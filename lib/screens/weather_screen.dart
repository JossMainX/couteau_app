import 'package:flutter/material.dart';
import '../services/api_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String? temperature;
  String? description;
  bool isLoading = false;

  Future<void> fetchWeather() async {
    setState(() => isLoading = true);

    final data = await ApiService.getWeather(_cityController.text.trim());

    if (data != null) {
      final current = data['current_condition'][0];
      setState(() {
        temperature = current['temp_C']; // Temperatura en °C
        description = current['weatherDesc'][0]['value']; // Descripción
        isLoading = false;
      });
    } else {
      setState(() {
        temperature = null;
        description = "No se pudo obtener el clima.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clima por Ciudad")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Consulta el clima:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                hintText: "Ej: Santo Domingo",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text("Buscar"),
            ),
            const SizedBox(height: 24),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (temperature != null)
              Center(
                child: Text(
                  "$temperature°C\n$description",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              )
            else
              const Center(
                child: Text(
                  "Ingresa una ciudad para ver el clima",
                  style: TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
