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
    this.playStoreOnTap,
    this.linkOnTap,
  });

  final List<String> assetImages;
  final String title;
  final String description;
  final List<String> skills;
  final Function()? githubOnTap;
  final Function()? linkOnTap;
  final Function()? playStoreOnTap;

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
            crossAxisCount: 7,
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
                  (playStoreOnTap != null)
                      ? SharedIconButton(icon: BoxIcons.bxl_play_store, onTap: playStoreOnTap)
                      : Container(),
                ],
              ),
              ...List.generate(
                assetImages.length,
                (index) => DesktopImageProyect(asset: assetImages[index]),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MobileProyect extends StatelessWidget {
  final List<String> assetImages;
  final String title;
  final String description;
  final List<String> skills;
  final Function()? githubOnTap;
  final Function()? linkOnTap;
  final Function()? playStoreOnTap;
  const MobileProyect(
      {super.key,
      required this.assetImages,
      required this.title,
      required this.description,
      required this.skills,
      this.githubOnTap,
      this.playStoreOnTap,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
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
                    ],
                  ),
                  const Spacer(),
                  SharedIconButton(icon: BoxIcons.bxl_github, onTap: githubOnTap),
                  (linkOnTap != null)
                      ? SharedIconButton(icon: BoxIcons.bx_link_external, onTap: linkOnTap)
                      : Container(),
                  (playStoreOnTap != null)
                      ? SharedIconButton(icon: BoxIcons.bxl_play_store, onTap: playStoreOnTap)
                      : Container(),
                ],
              ),
              SizedBox(height: height * .01),
              Container(
                padding: EdgeInsets.all(width * .03),
                color: colors.surface,
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                  style: textStyle.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * .05),
        SizedBox(
          width: double.infinity,
          height: width * 1.5,
          child: PageView(
            controller: PageController(
              initialPage: 0,
              viewportFraction: .76,
            ),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: List.generate(
              assetImages.length,
              (index) => MobileImageProyect(
                asset: assetImages[index],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .10),
          child: Column(
            children: [
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
            ],
          ),
        ),
      ],
    );
  }
}
