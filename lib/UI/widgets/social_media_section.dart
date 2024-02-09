import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/widgets/shared/shared_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    launchURL(String url) async {
      try {
        Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          print('error');
        }
      } catch (e) {
        print(e);
      }
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: height * .01,
      left: width * .03,
      child: Column(
        children: [
          SharedIconButton(
              icon: IonIcons.logo_linkedin,
              onTap: () {
                launchURL('https://www.linkedin.com/in/kamilochinome');
              }),
          SizedBox(height: height * .01),
          SharedIconButton(
              icon: IonIcons.logo_github,
              onTap: () {
                launchURL('https://github.com/KamiloChinome');
              }),
          SizedBox(height: height * .03),
        ].animate().slideY(duration: const Duration(milliseconds: 600)).fadeIn(),
      ),
    );
  }
}
