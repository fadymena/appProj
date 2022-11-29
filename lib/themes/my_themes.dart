import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData myDark() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 45, 30, 47),
      appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 45, 50, 47),
          shadowColor: Colors.transparent),
      cardColor: const Color.fromARGB(255, 169, 229, 187),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 45, 40, 47),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromARGB(255, 247, 179, 43),
      ),
    );
  }

  static ThemeData mylight() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 252, 246, 177),
      appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 252, 246, 150),
          shadowColor: Colors.transparent),
      cardColor: const Color.fromARGB(255, 169, 229, 187),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 252, 246, 160),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromARGB(255, 247, 179, 43),
      ),
    );
  }
}
