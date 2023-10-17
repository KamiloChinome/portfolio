import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/colors.dart';

class AppTheme {
  static darkTheme() => ThemeData(
      fontFamily: 'SpaceGrotesk',
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(primary: darkPrimary, secondary: darkSecondary),
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: transparent,
      ),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(overlayColor),
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 15)))),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(overlayColor),
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                side: const BorderSide(color: darkSecondary),
                foregroundColor: darkSecondary)
            .copyWith(overlayColor: const MaterialStatePropertyAll(overlayColor)),
      ));

  static lightTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
          // primary: ,
          // secondary: ,
          ),
      scaffoldBackgroundColor: darkBackground,
      textButtonTheme:
          const TextButtonThemeData(style: ButtonStyle(overlayColor: MaterialStatePropertyAll(transparent))),
      appBarTheme: const AppBarTheme(
        backgroundColor: transparent,
      ));
}
