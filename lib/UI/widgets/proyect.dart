import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/widgets/shared/shared_icon_button.dart';
import 'package:portfolio/UI/widgets/shared/shared_skill_proyect_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Proyectv1 extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final List<String> skills;
  const Proyectv1({
    super.key,
    required this.assetImage,
    required this.title,
    required this.description,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            assetImage,
            width: width * .37,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * .35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: textStyle.titleLarge,
                ),
                Text(
                  AppLocalizations.of(context)!.featuredProject,
                  style: textStyle.titleSmall!.copyWith(
                    fontFamily: 'PixelifySans',
                    color: colors.secondary,
                  ),
                ),
                SizedBox(height: height * .01),
                Container(
                  padding: EdgeInsets.all(width * .01),
                  color: colors.surface,
                  child: Text(
                    description,
                    textAlign: TextAlign.end,
                    style: textStyle.bodyLarge,
                  ),
                ),
                SizedBox(height: height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    skills.length,
                    (index) {
                      return Row(
                        children: [
                          SharedSkillProyectText(skills[index]),
                          SizedBox(width: width * .01),
                        ],
                      );
                    },
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SharedIconButton(icon: BoxIcons.bxl_github),
                    SharedIconButton(icon: BoxIcons.bx_link_external),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Proyectv2 extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final List<String> skills;
  const Proyectv2({
    super.key,
    required this.assetImage,
    required this.title,
    required this.description,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              assetImage,
              width: width * .37,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * .35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyle.titleLarge,
                ),
                Text(
                  'Proyecto Destacado',
                  style: textStyle.titleSmall!.copyWith(
                    fontFamily: 'PixelifySans',
                    color: colors.secondary,
                  ),
                ),
                SizedBox(height: height * .01),
                Container(
                  padding: EdgeInsets.all(width * .01),
                  color: colors.surface,
                  child: Text(
                    description,
                    textAlign: TextAlign.start,
                    style: textStyle.bodyLarge,
                  ),
                ),
                SizedBox(height: height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    skills.length,
                    (index) {
                      return Row(
                        children: [
                          SharedSkillProyectText(skills[index]),
                          SizedBox(width: width * .01),
                        ],
                      );
                    },
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SharedIconButton(icon: BoxIcons.bxl_github),
                    SharedIconButton(icon: BoxIcons.bx_link_external),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
