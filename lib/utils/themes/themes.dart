import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/themes/seedOne/seed_one_color_scheme.dart';
//import 'package:provider/provider.dart';



class PoopAppTheme {
  // make the constructor private
  PoopAppTheme._();





  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: PoopSeedOne.seedOneLightColorScheme,
      textTheme: TextTheme(
        displaySmall: TextStyle(fontSize: 20),
        displayMedium: TextStyle(fontSize: 35),
        displayLarge: TextStyle(fontSize: 50),
      ),
      brightness: Brightness.light,
    );




  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: PoopSeedOne.seedOneDarkColorScheme,
      textTheme: TextTheme(
        displaySmall: TextStyle(fontSize: 20),
        displayMedium: TextStyle(fontSize: 35),
        displayLarge: TextStyle(fontSize: 50),
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: PoopSeedOne.seedOneDarkColorScheme.surface,
    );

}