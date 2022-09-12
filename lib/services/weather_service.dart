import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_today/constant/shared_keys.dart';
import 'package:weather_today/model/weather_model.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      Uri uri =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

      http.Response response = await http.get(uri);

      Map<String, dynamic> data = jsonDecode(response.body);
      weatherData = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weatherData;
  }
}
