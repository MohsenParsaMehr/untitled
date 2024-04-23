import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';

class GreenLightTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: PersianFonts.Samim.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displayLarge: PersianFonts.Samim.copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: PersianFonts.Samim.copyWith(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: PersianFonts.Samim.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: PersianFonts.Samim.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: PersianFonts.Samim.copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displayLarge: PersianFonts.Samim.copyWith(
      fontSize: 31.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: PersianFonts.Samim.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: PersianFonts.Samim.copyWith(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: PersianFonts.Samim.copyWith(
      //GoogleFonts.openSans(
      fontSize: 19.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.green,
        onPrimary: Colors.black,
        // Colors that are not relevant to AppBar in LIGHT mode:
        secondary: Colors.grey,
        onSecondary: Colors.grey,
        background: Colors.grey,
        onBackground: Colors.grey,
        surface: Colors.grey,
        onSurface: Colors.grey,
        error: Colors.grey,
        onError: Colors.grey,
      ),
      fontFamily: PersianFonts.Yekan.fontFamily,
      primaryColor: Colors.green,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.green,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        surface: Colors.green,
        onSurface: Colors.black,
        // Colors that are not relevant to AppBar in DARK mode:
        primary: Colors.grey,
        onPrimary: Colors.grey,

        secondary: Colors.grey,

        onSecondary: Colors.grey,
        background: Colors.grey,
        onBackground: Colors.grey,
        error: Colors.grey,
        onError: Colors.grey,
      ),
      fontFamily: PersianFonts.Yekan.fontFamily,
      primaryColor: Colors.green,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }
}
