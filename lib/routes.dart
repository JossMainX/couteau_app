import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/gender_screen.dart';
import 'screens/age_screen.dart';
import 'screens/universities_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/pokemon_screen.dart';
import 'screens/wordpress_news_screen.dart';
import 'screens/about_screen.dart';

class AppRoutes {
  static const home = '/';
  static const gender = '/gender';
  static const age = '/age';
  static const universities = '/universities';
  static const weather = '/weather';
  static const pokemon = '/pokemon';
  static const wordpressNews = '/wordpress-news';
  static const about = '/about';
}

Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.home: (context) => const HomeScreen(),
  AppRoutes.gender: (context) => const GenderScreen(),
  AppRoutes.age: (context) => const AgeScreen(),
  AppRoutes.universities: (context) => const UniversitiesScreen(),
  AppRoutes.weather: (context) => const WeatherScreen(),
  AppRoutes.pokemon: (context) => const PokemonScreen(),
  AppRoutes.wordpressNews: (context) => const WordpressNewsScreen(),
  AppRoutes.about: (context) => const AboutScreen(),
};
