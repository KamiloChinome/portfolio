import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/widgets/shared/shared_icon_button.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: height * .01,
      left: width * .03,
      child: Column(
        children: [
          SharedIconButton(icon: IonIcons.logo_linkedin, onTap: () {}),
          SizedBox(height: height * .01),
          SharedIconButton(icon: IonIcons.logo_github, onTap: () {}),
          SizedBox(height: height * .01),
          SharedIconButton(icon: IonIcons.logo_instagram, onTap: () {}),
          SizedBox(height: height * .03),
        ].animate().slideY(duration: const Duration(milliseconds: 600)).fadeIn(),
      ),
    );
  }
}
