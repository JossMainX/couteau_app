import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/api_service.dart';

class UniversitiesScreen extends StatefulWidget {
  const UniversitiesScreen({super.key});

  @override
  State<UniversitiesScreen> createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {
  final TextEditingController _countryController = TextEditingController();
  List<dynamic>? _universities;

  Future<void> buscarUniversidades() async {
    String country = _countryController.text.trim();

    if (country.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor escribe un país en inglés.")),
      );
      return;
    }

    List<dynamic>? data = await ApiService.getUniversities(country);

    setState(() {
      _universities = data;
    });
  }

  void abrirWeb(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Universidades por País")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _countryController,
              decoration: const InputDecoration(
                labelText: "Nombre del país en inglés",
                hintText: "Ej: Dominican Republic",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: buscarUniversidades,
              child: const Text("Buscar"),
            ),
            const SizedBox(height: 20),

            _universities == null
                ? const Text("Escribe un país y presiona buscar.")
                : Expanded(
              child: ListView.builder(
                itemCount: _universities!.length,
                itemBuilder: (context, index) {
                  final uni = _universities![index];
                  return Card(
                    child: ListTile(
                      title: Text(uni["name"] ?? "Sin nombre"),
                      subtitle: Text((uni["domains"] != null && uni["domains"].isNotEmpty)
                          ? uni["domains"][0]
                          : "Sin dominio"),
                      trailing: TextButton(
                        onPressed: () => abrirWeb(
                          uni["web_pages"] != null && uni["web_pages"].isNotEmpty
                              ? uni["web_pages"][0]
                              : "",
                        ),
                        child: const Text("Visitar"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
