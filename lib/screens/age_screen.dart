import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final TextEditingController _nameController = TextEditingController();
  int? _edad;
  String? _categoria;
  String? _imagen;

  Future<void> obtenerEdad() async {
    String nombre = _nameController.text.trim();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor escribe un nombre.")),
      );
      return;
    }

    int? age = await ApiService.getAge(nombre);

    setState(() {
      _edad = age;

      if (age == null) {
        _categoria = "No se pudo estimar";
        _imagen = null;
        return;
      }

      if (age < 18) {
        _categoria = "Joven";
        _imagen = "assets/images/joven.png";
      } else if (age < 60) {
        _categoria = "Adulto";
        _imagen = "assets/images/adulto.png";
      } else {
        _categoria = "Anciano";
        _imagen = "assets/images/anciano.png";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Predicción de Edad")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Escribe un nombre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: obtenerEdad,
              child: const Text("Predecir Edad"),
            ),
            const SizedBox(height: 30),

            if (_edad != null) ...[
              Text(
                "Edad aproximada: $_edad años",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Categoría: $_categoria",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              if (_imagen != null)
                Image.asset(_imagen!, height: 180),
            ],
          ],
        ),
      ),
    );
  }
}
