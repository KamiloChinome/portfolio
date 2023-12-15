import 'package:flutter/material.dart';
import 'package:portfolio/UI/screens/home/desktop_home.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => const DesktopHomeScreen(),
      mobile: (context) => const DesktopHomeScreen(),
    );
  }
}
