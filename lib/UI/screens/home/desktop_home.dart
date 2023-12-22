import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/UI/widgets/about_me_animated_text.dart';
import 'package:portfolio/UI/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/models/job_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutKey = GlobalKey();
    final workKey = GlobalKey();
    final skillsKey = GlobalKey();
    final experienceKey = GlobalKey();
    final contactKey = GlobalKey();

    Future scrollToSection(GlobalKey key) async {
      final context = key.currentContext!;
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        alignment: .5,
      );
    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            _SliverAppBar(
              onPressed: (key) => scrollToSection(key),
              aboutKey: aboutKey,
              contactKey: contactKey,
              experienceKey: experienceKey,
              skillsKey: skillsKey,
              workKey: workKey,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: height * .1),
                  _AboutMe(
                    key: aboutKey,
                  ),
                  SizedBox(height: height * .3),
                  _Skills(key: skillsKey),
                  SizedBox(height: height * .2),
                  _Proyects(key: workKey),
                  SizedBox(height: height * .2),
                  _Experience(key: experienceKey),
                  SizedBox(height: height * .2),
                  _Contact(key: contactKey),
                  SizedBox(height: height * .2),
                ],
              ),
            ),
          ],
        ),
        const SocialMediaSection(),
        const ConfigurationSection()
      ],
    ));
  }
}

class _Contact extends StatelessWidget {
  const _Contact({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.contact,
            style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
          ),
          const Divider(),
          SizedBox(height: height * .1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ContactCard(
                  title: AppLocalizations.of(context)!.location,
                  description: 'Bogotá, Colombia',
                  icon: BoxIcons.bx_home),
              ContactCard(
                  title: AppLocalizations.of(context)!.phone, description: '+57 3219642996', icon: BoxIcons.bx_phone),
              ContactCard(
                  title: AppLocalizations.of(context)!.email,
                  description: 'kamiloandresch@gmail.com',
                  icon: BoxIcons.bx_envelope),
            ],
          )
        ],
      ),
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience({super.key});

  @override
  Widget build(BuildContext context) {
    List<Job> jobs = [
      Job(
        jobTitle: AppLocalizations.of(context)!.flutterDeveloper,
        companyName: 'Santo Mining Corp',
        period: 'DEC 2023 - ACTUALMENTE',
        contributions: [
          AppLocalizations.of(context)!.requirementsIdentification,
          AppLocalizations.of(context)!.comprehensiveMobileApps,
        ],
      ),
      Job(
        jobTitle: AppLocalizations.of(context)!.flutterDeveloper,
        companyName: 'TalentPitch',
        period: 'MAY 2023 - OCT 2023',
        contributions: [
          AppLocalizations.of(context)!.maintenanceOptimization,
          AppLocalizations.of(context)!.efficientBugFixing,
          AppLocalizations.of(context)!.responsiveMobileApps,
        ],
      ),
      Job(
        jobTitle: AppLocalizations.of(context)!.flutterDeveloper,
        companyName: 'Freelance',
        period: 'OCT 2022 - MAY 2023',
        contributions: [
          AppLocalizations.of(context)!.endtoEndMobileApps,
          AppLocalizations.of(context)!.successfulIntegration,
          AppLocalizations.of(context)!.thirdPartyLibraries,
        ],
      ),
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.workExperience,
            style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
          ),
          const Divider(),
          SizedBox(height: height * .1),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: width * .03,
            mainAxisSpacing: width * .03,
            childAspectRatio: .9,
            shrinkWrap: true,
            children: List.generate(
              jobs.length,
              (index) => JobCard(
                job: jobs[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Proyects extends StatelessWidget {
  const _Proyects({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.projects,
            style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
          ),
          const Divider(),
          SizedBox(height: height * .1),
          Proyectv2(
            assetImage: 'assets/images/petto-proyect.png',
            title: 'Petto',
            description: AppLocalizations.of(context)!.pettoDescription,
            skills: const ['Flutter', 'Dart', 'Firebase', 'Git', 'SOLID', 'Clean Arquitecture'],
          ),
          SizedBox(height: height * .25),
          Proyectv1(
            assetImage: 'assets/images/MiProceso-proyect.png',
            title: 'Mi Proceso',
            description: AppLocalizations.of(context)!.legalProcessInterface,
            skills: const ['Flutter', 'Dart', 'Git', 'Clean Arquitecture'],
          ),
          SizedBox(height: height * .3),
          Proyectv2(
            assetImage: 'assets/images/cinemapedia-proyect.png',
            title: 'Cinemapedia',
            description: AppLocalizations.of(context)!.movieAppDescription,
            skills: const ['Flutter', 'Dart', 'API', 'Git', 'SOLID', 'Clean Arquitecture'],
          ),
        ],
      ),
    );
  }
}

class _Skills extends StatelessWidget {
  const _Skills({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.skills,
            style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
          ),
          const Divider(),
          SizedBox(height: height * .05),
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
        ],
      ),
    );
  }
}

class _AboutMe extends StatelessWidget {
  const _AboutMe({super.key});

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
        ],
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  final GlobalKey aboutKey;
  final GlobalKey workKey;
  final GlobalKey skillsKey;
  final GlobalKey experienceKey;
  final GlobalKey contactKey;
  final Function(GlobalKey key) onPressed;

  const _SliverAppBar({
    required this.onPressed,
    required this.aboutKey,
    required this.workKey,
    required this.skillsKey,
    required this.experienceKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    _launchURL(String url) async {
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
        ),
      ).animate().slideY(duration: const Duration(milliseconds: 600)).fadeIn(),
      actions: [
        SharedTextButton(
          text: AppLocalizations.of(context)!.about,
          onPressed: () => onPressed(aboutKey),
        ),
        SizedBox(width: width * .01),
        SharedTextButton(
          text: AppLocalizations.of(context)!.skills,
          onPressed: () => onPressed(skillsKey),
        ),
        SizedBox(width: width * .01),
        SharedTextButton(
          text: AppLocalizations.of(context)!.work,
          onPressed: () => onPressed(workKey),
        ),
        SizedBox(width: width * .01),
        SharedTextButton(
          text: AppLocalizations.of(context)!.experience,
          onPressed: () => onPressed(experienceKey),
        ),
        SizedBox(width: width * .01),
        SharedTextButton(
          text: AppLocalizations.of(context)!.contact,
          onPressed: () => onPressed(contactKey),
        ),
        SizedBox(width: width * .01),
        SharedOutlinedButton(
          text: AppLocalizations.of(context)!.resume,
          onPressed: () => _launchURL(
              'https://firebasestorage.googleapis.com/v0/b/petto-18ace.appspot.com/o/CV%20KAMILO%20CHINOME.pdf?alt=media&token=1cda18c7-cdbf-4ab0-aa30-15f233dd4b55'),
        ),
        SizedBox(width: width * .03),
      ],
    );
  }
}
