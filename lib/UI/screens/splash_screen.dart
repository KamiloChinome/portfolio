import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  static const name = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Image.asset(
          'assets/kchLogo1.png',
          height: 190,
        )
            .animate()
            .fade(duration: const Duration(milliseconds: 1500))
            .scale(duration: const Duration(milliseconds: 1500), curve: Curves.easeInOutQuint),
        FutureBuilder(
          future: animateLogo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Image.asset(
                'assets/kchLogo2.png',
                height: 190,
              ).animate(onComplete: (controller) {
                // Future.delayed(const Duration(milliseconds: 1500), () => context.pushReplacementNamed('home'));
              }).fade(duration: const Duration(milliseconds: 500));
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    )).animate().scaleXY(begin: 1, end: 0, delay: const Duration(seconds: 2), curve: Curves.easeInOutQuint));
  }

  Future<void> animateLogo() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
