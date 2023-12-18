import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/widgets/shared/shared_icon_button.dart';
import 'package:portfolio/UI/widgets/shared/shared_skill_proyect_text.dart';

class Proyect extends StatelessWidget {
  final String assetImage;
  final String title;
  final String typeProyect;
  final String description;
  final List<String> skills;
  const Proyect({
    super.key,
    required this.assetImage,
    required this.title,
    required this.typeProyect,
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
                  typeProyect,
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
