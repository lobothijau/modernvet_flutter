import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF065C99),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF065C99),
    primary: const Color(0xFF065C99),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF065C99),
      foregroundColor: Colors.white,
    ),
  ),
  fontFamily: 'Nunito',
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);
