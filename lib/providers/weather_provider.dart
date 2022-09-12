import 'package:flutter/material.dart';
import 'package:weather_today/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;
  set weatherData(WeatherModel? weatherModel) {
    _weatherData = weatherModel;
    notifyListeners();
  }

  WeatherModel? get getWeatherData => _weatherData;
}
