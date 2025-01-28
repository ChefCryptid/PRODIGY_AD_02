import 'package:flutter/material.dart';

class ThemedataApp {
  static ThemeData lightMode = ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          primary: Colors.grey.shade300,
          secondary: Colors.grey.shade500));

  static ThemeData darkMode = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
          surface: Colors.grey.shade900,
          primary: Colors.grey.shade800,
          secondary: Colors.grey.shade600));
}
