import 'package:flutter/material.dart';
import 'package:portfolio/UI/widgets/about_me_animated_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceScreenType deviceType = getDeviceType(MediaQuery.of(context).size);
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    double fontSize = (deviceType == DeviceScreenType.desktop) ? 80 : 50;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AboutMeAnimatedText(),
            Text(
              AppLocalizations.of(context)!.kamiloChinome,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: fontSize),
            ),
            Text(
              AppLocalizations.of(context)!.iAmFlutterDeveloper,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: colors.onBackground.withOpacity(.5),
                    fontSize: fontSize,
                  ),
            ),
            const SizedBox(height: 25),
            Text(
              AppLocalizations.of(context)!.aboutMe,
              style: textStyle.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
