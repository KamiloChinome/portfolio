import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/providers/language_provider.dart';
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
          slivers: [const _SliverAppBar(), SliverList.list(children: const [])],
        ),
        const _SocialMediaSection(),
        Positioned(
            bottom: 15,
            right: 40,
            child: Column(
              children: [
                SharedTextIconButton(
                  text: (context.watch<LanguageProvider>().language == 'en') ? 'es' : 'en',
                  onTab: () => context.read<LanguageProvider>().changeLanguage(),
                ),
                const SizedBox(height: 7),
                const SharedIconButton(icon: Icons.dark_mode_outlined),
              ],
            ))
      ],
    ));
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar();

  @override
  Widget build(BuildContext context) {
    return SharedSliverAppBar(
        leading: IconButton(
            onPressed: () {},
            splashRadius: 25,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Image.asset(
              'assets/kchLogo.png',
              height: 50,
            )).animate().slideY(),
        actions: [
          SharedTextButton(text: AppLocalizations.of(context)!.about),
          const SizedBox(width: 7),
          SharedTextButton(text: AppLocalizations.of(context)!.experience),
          const SizedBox(width: 7),
          SharedTextButton(text: AppLocalizations.of(context)!.work),
          const SizedBox(width: 7),
          SharedTextButton(text: AppLocalizations.of(context)!.contact),
          const SizedBox(width: 7),
          SharedOutlinedButton(text: AppLocalizations.of(context)!.resume),
          const SizedBox(width: 40),
        ].animate().slideY());
  }
}

class _SocialMediaSection extends StatelessWidget {
  const _SocialMediaSection();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 40,
      child: Column(
        children: [
          const SharedIconButton(icon: IonIcons.logo_linkedin),
          const SizedBox(height: 7),
          const SharedIconButton(icon: IonIcons.logo_github),
          const SizedBox(height: 7),
          const SharedIconButton(icon: IonIcons.logo_instagram),
          const SizedBox(height: 7),
          const SharedIconButton(icon: IonIcons.mail),
        ].animate().slideY(),
      ),
    );
  }
}
