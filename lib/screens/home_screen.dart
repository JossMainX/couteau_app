import 'package:flutter/material.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caja de Herramientas'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Couteau App - Menú',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_search),
              title: const Text('Predecir Género'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.gender);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text('Predecir Edad'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.age);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Universidades'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.universities);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud),
              title: const Text('Clima en RD'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.weather);
              },
            ),
            ListTile(
              leading: const Icon(Icons.catching_pokemon),
              title: const Text('Pokémon'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.pokemon);
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Noticias WordPress'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.wordpressNews);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de mí'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.about);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/caja_herramientas.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenido a la App Multifuncional',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Abre el menú lateral deslizando desde la izquierda para acceder a las funciones.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
