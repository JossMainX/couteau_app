import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String?> getGender(String name) async {
    final url = Uri.parse('https://api.genderize.io/?name=$name');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['gender']; // puede ser 'male', 'female' o null
    } else {
      return null;
    }
  }

  static Future<int?> getAge(String name) async {
    final url = Uri.parse('https://api.agify.io/?name=$name');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['age']; // devuelve un entero o null
    } else {
      return null;
    }
  }

  static Future<List<dynamic>?> getUniversities(String country) async {
    final url = Uri.parse("https://adamix.net/proxy.php?country=$country");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data; // Es una lista de universidades
    } else {
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getWeather(String city) async {
    final url = Uri.parse('https://wttr.in/$city?format=j1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data; // Devuelve todo el JSON
    } else {
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getPokemon(String name) async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/${name.toLowerCase()}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<List<dynamic>?> getWordpressNews({int page = 1}) async {
    final url = Uri.parse('https://techcrunch.com/wp-json/wp/v2/posts?per_page=3&page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

}
