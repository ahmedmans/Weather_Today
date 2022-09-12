import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/constant/colors.dart';
import 'package:weather_today/model/weather_model.dart';
import 'package:weather_today/pages/home_page.dart';
import 'package:weather_today/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather ToDay',
      theme: ThemeData(
        primarySwatch:
            Provider.of<WeatherProvider>(context).getWeatherData == null
                ? const MaterialColor(
                    0xff89392b, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
                    <int, Color>{
                      50: Color(0xffce5641), //10%
                      100: Color(0xffb74c3a), //20%
                      200: Color(0xffa04332), //30%
                      300: Color(0xff89392b), //40%
                      400: Color(0xff733024), //50%
                      500: Color(0xff5c261d), //60%
                      600: Color(0xff451c16), //70%
                      700: Color(0xff2e130e), //80%
                      800: Color(0xff170907), //90%
                      900: Color(0xff000000), //100%
                    },
                  )
                : Provider.of<WeatherProvider>(context)
                    .getWeatherData!
                    .getThemeColor(),
        appBarTheme: const AppBarTheme(
          //backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}
