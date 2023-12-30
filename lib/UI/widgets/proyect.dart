import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/UI/widgets/widgets.dart';

class DesktopProyect extends StatelessWidget {
  const DesktopProyect({
    super.key,
    required this.assetImages,
    required this.title,
    required this.description,
    required this.skills,
    this.githubOnTap,
    this.linkOnTap,
  });

  final List<String> assetImages;
  final String title;
  final String description;
  final List<String> skills;
  final Function()? githubOnTap;
  final Function()? linkOnTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
            width: width * .5,
            padding: EdgeInsets.all(width * .01),
            color: colors.surface,
            child: Text(
              description,
              textAlign: TextAlign.end,
              style: textStyle.bodyLarge,
            ),
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 6,
            shrinkWrap: true,
            childAspectRatio: 1.7,
            children: List.generate(
              skills.length,
              (index) {
                return SharedSkillProyectText(skills[index]);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SharedIconButton(icon: BoxIcons.bxl_github, onTap: githubOnTap),
                  (linkOnTap != null)
                      ? SharedIconButton(icon: BoxIcons.bx_link_external, onTap: linkOnTap)
                      : Container(),
                ],
              ),
              ...List.generate(
                assetImages.length,
                (index) => ImageProyect(asset: assetImages[index]),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MobileProyectv1 extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final List<String> skills;
  final Function()? githubOnTap;
  final Function()? linkOnTap;
  const MobileProyectv1(
      {super.key,
      required this.assetImage,
      required this.title,
      required this.description,
      required this.skills,
      this.githubOnTap,
      this.linkOnTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            textAlign: TextAlign.start,
            style: textStyle.bodyLarge,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            assetImage,
            fit: BoxFit.cover,
          ),
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          shrinkWrap: true,
          childAspectRatio: 1.7,
          children: List.generate(
            skills.length,
            (index) {
              return SharedSkillProyectText(skills[index]);
            },
          ),
        ),
        SizedBox(height: height * .01),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (linkOnTap != null) ? SharedIconButton(icon: BoxIcons.bx_link_external, onTap: linkOnTap) : Container(),
            SharedIconButton(icon: BoxIcons.bxl_github, onTap: githubOnTap),
          ],
        ),
      ],
    );
  }
}

class MobileProyectv2 extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final List<String> skills;
  final Function()? githubOnTap;
  final Function()? linkOnTap;

  const MobileProyectv2({
    super.key,
    required this.assetImage,
    required this.title,
    required this.description,
    required this.skills,
    this.githubOnTap,
    this.linkOnTap,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
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
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            assetImage,
            fit: BoxFit.cover,
          ),
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          shrinkWrap: true,
          childAspectRatio: 1.7,
          children: List.generate(
            skills.length,
            (index) {
              return SharedSkillProyectText(skills[index]);
            },
          ),
        ),
        SizedBox(height: height * .01),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            (linkOnTap != null) ? SharedIconButton(icon: BoxIcons.bx_link_external, onTap: linkOnTap) : Container(),
            SharedIconButton(icon: BoxIcons.bxl_github, onTap: githubOnTap),
          ],
        ),
      ],
    );
  }
}
