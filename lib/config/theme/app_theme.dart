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
        backgroundColor: transparent,
      ),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(darkOverlayColor),
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 15)))),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(darkOverlayColor),
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                side: const BorderSide(color: darkSecondary),
                foregroundColor: darkSecondary)
            .copyWith(overlayColor: const MaterialStatePropertyAll(darkOverlayColor)),
      ));

  static lightTheme() => ThemeData(
      useMaterial3: true,
      colorScheme:
          const ColorScheme.light(primary: lightPrimary, secondary: lightSecondary, onBackground: lightOnBackground),
      scaffoldBackgroundColor: lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: transparent,
      ),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(lightOverlayColor),
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 15)))),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(lightOverlayColor),
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                side: const BorderSide(color: lightSecondary),
                foregroundColor: lightSecondary)
            .copyWith(overlayColor: const MaterialStatePropertyAll(lightOverlayColor)),
      ));
}
