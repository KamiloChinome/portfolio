import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/UI/providers/language_provider.dart';
import 'package:provider/provider.dart';

class AboutMeAnimatedText extends StatelessWidget {
  const AboutMeAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        ColorScheme colors = Theme.of(context).colorScheme;
        return Column(
          children: [
            Visibility(
              visible: (context.watch<LanguageProvider>().language == 'es'),
              child: AnimatedTextKit(totalRepeatCount: 1, repeatForever: false, animatedTexts: [
                TypewriterAnimatedText(
                  'Hola, mi nombre es',
                  speed: const Duration(milliseconds: 150),
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: 'PixelifySans',
                        color: colors.secondary,
                      ),
                )
              ]),
            ),
            Visibility(
              visible: (context.watch<LanguageProvider>().language == 'en'),
              child: AnimatedTextKit(totalRepeatCount: 1, repeatForever: false, animatedTexts: [
                TypewriterAnimatedText(
                  'Hello, my name is',
                  speed: const Duration(milliseconds: 150),
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: 'PixelifySans',
                        color: colors.secondary,
                      ),
                )
              ]),
            ),
          ],
        );
      },
    );
  }
}
