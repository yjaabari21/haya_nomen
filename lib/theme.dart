import 'package:flutter/material.dart';

class AppTheme {
  // =========================
  // Light Theme
  // =========================

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0097A7),
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),

    cardTheme: const CardThemeData(color: Colors.white, elevation: 3),
  );

  // =========================
  // Dark Theme
  // =========================

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00C9C8),
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: const Color(0xFF121212),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    cardTheme: const CardThemeData(color: Color(0xFF1E1E1E), elevation: 3),
  );
}
