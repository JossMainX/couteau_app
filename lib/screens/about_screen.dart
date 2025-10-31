import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Acerca de mí")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FOTO
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/foto.png'),
            ),
            const SizedBox(height: 20),

            // NOMBRE
            const Text(
              "Jose Miguel Fernandez Perez",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            // MATRÍCULA
            const Text(
              "Matrícula: 2023-1720",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // DESCRIPCIÓN PERSONAL
            const Text(
              "Desarrollador móvil en crecimiento. Apasionado por crear aplicaciones eficientes, "
                  "limpias y útiles para las personas.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 25),

            // CONTACTOS
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, size: 20),
                SizedBox(width: 8),
                Text("Jmfernandez.Perez001@gmail.com"),
              ],
            ),
            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, size: 20),
                SizedBox(width: 8),
                Text("+1 (849) 214-6096"),
              ],
            ),
            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.link, size: 20),
                SizedBox(width: 8),
                Text("N/A"),
              ],
            ),

            const Spacer(),

            // PIE
            const Text(
              "© 2025 - Todos los derechos reservados",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
