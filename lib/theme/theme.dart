import 'package:flutter/material.dart';

class AppTheme {
  static final primary = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFFe63946),
    accentColor: Color(0xFF003049),
    colorScheme: ColorScheme.light().copyWith(
      primary: Color(0xFFD62828),
      primaryVariant: Color(0xFF264653),
      secondary: Color(0xFF2A9D8F),
      secondaryVariant: Color(0xFFE9C46A),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(color: Colors.white),
    fontFamily: 'Montserrat',
  );
}
