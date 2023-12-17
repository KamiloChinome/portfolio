import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/UI/providers/language_provider.dart';
import 'package:portfolio/UI/widgets/shared/shared_icon_button.dart';
import 'package:provider/provider.dart';

class ConfigurationSection extends StatelessWidget {
  const ConfigurationSection({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: height * .01,
      right: width * .03,
      child: Column(
        children: [
          SharedTextIconButton(
            text: (context.watch<LanguageProvider>().language == 'en') ? 'es' : 'en',
            onTap: () => context.read<LanguageProvider>().changeLanguage(),
          ),
          SizedBox(height: height * .03),
        ].animate().slideY(duration: const Duration(milliseconds: 600)).fadeIn(),
      ),
    );
  }
}
