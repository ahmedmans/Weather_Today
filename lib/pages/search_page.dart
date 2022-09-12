import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/constant/colors.dart';
import 'package:weather_today/model/weather_model.dart';
import 'package:weather_today/providers/weather_provider.dart';
import 'package:weather_today/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? cityName;

    return Scaffold(
      backgroundColor: AppColor.kPrimaryDark,
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryDark,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              cityName = value;
              WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Search',
              hintText: 'Enter City',
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();

                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
