import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const CouteauApp());
}

class CouteauApp extends StatelessWidget {
  const CouteauApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couteau App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
