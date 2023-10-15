import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String name = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => context.pushReplacementNamed('home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset(
      'assets/logoKCH.png',
      height: 170,
    )
                .animate()
                .scale(duration: const Duration(seconds: 2), curve: Curves.easeInOutQuint)
                .fade(duration: const Duration(seconds: 2), curve: Curves.easeInOutQuint)));
  }
}
