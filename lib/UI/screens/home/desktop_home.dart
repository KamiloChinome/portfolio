import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/widgets/about_me_animated_text.dart';
import 'package:portfolio/UI/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            const _SliverAppBar(),
            SliverList.list(
              children: [
                SizedBox(height: height * .1),
                const _AboutMe(),
                SizedBox(height: height * .3),
                const _Skills(),
                SizedBox(height: height * .2),
                const _Proyects(),
                SizedBox(height: height * .2),
              ],
            ),
          ],
        ),
        const SocialMediaSection(),
        const ConfigurationSection()
      ],
    ));
  }
}

class _Proyects extends StatelessWidget {
  const _Proyects();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        children: [
          Text(
            'Proyectos',
            style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
          ),
          const Divider(),
          SizedBox(height: height * .1),
          const Proyect(
            assetImage: 'assets/images/petto-proyect.png',
            title: 'Petto',
            typeProyect: 'Proyecto real',
            description:
                'Petto es tu aliado para el cuidado de mascotas. Acceso rápido a datos importantes, recordatorios clave para citas y vacunas, además de consejos expertos para mantener a tus amigos peludos sanos y felices. Simplifica tu vida cuidando a tus mascotas con Petto.',
            skills: ['Flutter', 'Dart', 'Firebase', 'Git', 'SOLID', 'Clean Arquitecture'],
          )
        ],
      ),
    );
  }
}

class _Skills extends StatelessWidget {
  const _Skills();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Habilidades',
            style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SharedLogoSkill(Brands.flutter, 'Flutter'),
              SharedLogoSkill(Brands.dart, 'Dart'),
              SharedLogoSkill(Brands.git, 'Git'),
              SharedLogoSkill(Brands.firebase, 'Firebase'),
              SharedLogoSkill(Brands.docker, 'Docker'),
              SharedLogoSkill(Brands.postgresql, 'PostgreSQL'),
            ],
          )
        ].animate().slideX().fadeIn(),
      ),
    );
  }
}

class _AboutMe extends StatelessWidget {
  const _AboutMe();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AboutMeAnimatedText(),
          Text(
            AppLocalizations.of(context)!.kamiloChinome,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 80),
          ),
          Text(
            AppLocalizations.of(context)!.iAmFlutterDeveloper,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: colors.onBackground.withOpacity(.5),
                  fontSize: 80,
                ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .15),
            child: Text(
              AppLocalizations.of(context)!.aboutMe,
              style: textStyle.bodyLarge,
              textAlign: TextAlign.center,
            ),
          )
        ].animate().slideY(begin: 1, duration: const Duration(milliseconds: 500)).fadeIn(),
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SharedSliverAppBar(
      leading: IconButton(
          onPressed: () {},
          splashRadius: 25,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Image.asset(
            'assets/kchLogo.png',
            height: height * .07,
            width: height * .07,
          )).animate().slideY(duration: const Duration(milliseconds: 600)).fadeIn(),
      actions: [
        SharedTextButton(text: AppLocalizations.of(context)!.about),
        SizedBox(width: width * .01),
        SharedTextButton(text: AppLocalizations.of(context)!.experience),
        SizedBox(width: width * .01),
        SharedTextButton(text: AppLocalizations.of(context)!.work),
        SizedBox(width: width * .01),
        SharedTextButton(text: AppLocalizations.of(context)!.contact),
        SizedBox(width: width * .01),
        SharedOutlinedButton(text: AppLocalizations.of(context)!.resume),
        SizedBox(width: width * .03),
      ].animate().slideY(duration: const Duration(milliseconds: 600)).fadeIn(),
    );
  }
}
