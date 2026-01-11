import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData buildTheme() {
    const seed = Color(0xFF3AAFA9);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: seed),
      scaffoldBackgroundColor: const Color(0xFFEFFCFB),
    );
  }
}
