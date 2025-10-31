import 'package:flutter/material.dart';
import '../services/api_service.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? genderResult;

  void predictGender() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final result = await ApiService.getGender(name);

    setState(() {
      genderResult = result; // male / female / null
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor;

    if (genderResult == "male") {
      bgColor = Colors.blue.shade200;
    } else if (genderResult == "female") {
      bgColor = Colors.pink.shade200;
    } else {
      bgColor = Colors.grey.shade200;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicción de Género'),
      ),
      body: Container(
        width: double.infinity,
        color: bgColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingrese un nombre:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ej: Juan',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: predictGender,
              child: const Text('Predecir'),
            ),

            const SizedBox(height: 30),

            if (genderResult != null)
              Text(
                genderResult == "male"
                    ? "Género Predicho: Masculino"
                    : "Género Predicho: Femenino",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

            if (genderResult == null)
              const Text(
                "No se pudo predecir el género",
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
