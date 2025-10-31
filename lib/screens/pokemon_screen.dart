import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/api_service.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? pokemonData;
  bool isLoading = false;
  final AudioPlayer _player = AudioPlayer();

  Future<void> fetchPokemon() async {
    setState(() => isLoading = true);

    final data = await ApiService.getPokemon(_controller.text.trim());

    setState(() {
      pokemonData = data;
      isLoading = false;
    });
  }

  Future<void> playCry() async {
    if (pokemonData != null) {
      final cryUrl = pokemonData!["cries"]?["latest"];
      if (cryUrl != null) {
        await _player.play(UrlSource(cryUrl));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Información de Pokémon")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Nombre del Pokémon",
                hintText: "Ej: pikachu",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetchPokemon,
              child: const Text("Buscar"),
            ),
            const SizedBox(height: 20),

            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (pokemonData != null) ...[
              Image.network(
                pokemonData!["sprites"]["front_default"],
                height: 150,
              ),
              const SizedBox(height: 10),
              Text(
                "Experiencia base: ${pokemonData!["base_experience"]}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text("Habilidades:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...pokemonData!["abilities"]
                  .map<Widget>((a) => Text("- ${a["ability"]["name"]}"))
                  .toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: playCry,
                child: const Text("Reproducir sonido"),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
