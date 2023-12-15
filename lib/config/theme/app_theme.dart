import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/colors.dart';

class AppTheme {
  static ThemeData darkTheme() => ThemeData(
        fontFamily: 'SpaceGrotesk',
        useMaterial3: true,
        colorScheme:
            const ColorScheme.dark(primary: darkPrimary, secondary: darkSecondary, onBackground: darkOnBackground),
        scaffoldBackgroundColor: darkBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: darkBackground,
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(darkOverlayColor),
            textStyle: MaterialStatePropertyAll(
              TextStyle(),
            ),
          ),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(darkOverlayColor),
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: 20),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            side: const BorderSide(color: darkSecondary),
            foregroundColor: darkSecondary,
          ).copyWith(
            overlayColor: const MaterialStatePropertyAll(darkOverlayColor),
          ),
        ),
      );
}
