import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<Map<String, dynamic>> fetchWeatherData(
      String? cityName, String? country) async {
    const apiKey = '505ca93053955540d09b33099afbd2ec';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await client.get(Uri.parse(url)); // Use the static 'client' variable directly
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Return the parsed JSON data
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
