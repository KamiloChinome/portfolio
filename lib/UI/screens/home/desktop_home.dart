import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/providers/language_provider.dart';
import 'package:portfolio/UI/widgets/about_me_animated_text.dart';
import 'package:portfolio/UI/widgets/shared/shared_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            const _SliverAppBar(),
            SliverList.list(
              children: const [_AboutMe(), _Skills()],
            ),
          ],
        ),
        const _SocialMediaSection(),
        const _ConfigurationSection()
      ],
    ));
  }
}

class _Skills extends StatelessWidget {
  const _Skills();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .11, vertical: height * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Habilidades',
              style: textStyle.titleLarge!.copyWith(color: colors.secondary),
            ),
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _LogoSkill(Brands.flutter, 'Flutter'),
              _LogoSkill(Brands.dart, 'Dart'),
              _LogoSkill(Brands.git, 'Git'),
              _LogoSkill(Brands.firebase, 'Firebase'),
              _LogoSkill(Brands.docker, 'Docker'),
              _LogoSkill(Brands.postgresql, 'PostgreSQL'),
            ],
          )
        ].animate().slideX().fadeIn(),
      ),
    );
  }
}

class _LogoSkill extends StatelessWidget {
  final String brandLogo;
  final String text;
  const _LogoSkill(this.brandLogo, this.text);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Brand(
          brandLogo,
          size: width * .05,
        ),
        Text(text)
      ],
    );
  }
}

class _AboutMe extends StatelessWidget {
  const _AboutMe();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .11, vertical: height * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: EdgeInsets.only(right: width * .35),
            child: Text(
              AppLocalizations.of(context)!.aboutMe,
              style: textStyle.bodyLarge,
            ),
          )
        ].animate().slideY(begin: 2, duration: const Duration(milliseconds: 500)).fadeIn(),
      ),
    );
  }
}

class _ConfigurationSection extends StatelessWidget {
  const _ConfigurationSection();

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

class _SocialMediaSection extends StatelessWidget {
  const _SocialMediaSection();

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
          SizedBox(height: height * .01),
          SharedIconButton(icon: IonIcons.mail, onTap: () {}),
          SizedBox(height: height * .03),
        ].animate().slideY(duration: const Duration(milliseconds: 600)).fadeIn(),
      ),
    );
  }
}
