import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/UI/providers/language_provider.dart';
import 'package:portfolio/UI/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/models/job_model.dart';
import 'package:provider/provider.dart';
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
    double height = MediaQuery.of(context).size.height;

    Future scrollToSection(GlobalKey key) async {
      final context = key.currentContext!;
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
      );
    }

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
                  AboutMe(key: aboutKey),
                  SizedBox(height: height * .3),
                  _Skills(key: skillsKey),
                  SizedBox(height: height * .2),
                  _Proyects(widgetKey: workKey),
                  SizedBox(height: height * .2),
                  _Experience(key: experienceKey),
                  SizedBox(height: height * .2),
                  Contact(key: contactKey),
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

class _Experience extends StatelessWidget {
  const _Experience({super.key});

  @override
  Widget build(BuildContext context) {
    List<Job> jobs = [
      Job(
        jobTitle: AppLocalizations.of(context)!.flutterDeveloper,
        companyName: 'OmniTech Software SAS',
        period: 'NOV 2023 - ACTUALMENTE',
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SharedSectionDivider(text: AppLocalizations.of(context)!.workExperience),
          SizedBox(height: height * .1),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: width * .03,
            mainAxisSpacing: width * .03,
            childAspectRatio: width * .0006,
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
  @override
  const _Proyects({required this.widgetKey});
  final GlobalKey widgetKey;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .10),
      child: Column(
        children: [
          SharedSectionDivider(
            key: widgetKey,
            text: AppLocalizations.of(context)!.projects,
          ),
          SizedBox(height: height * .03),
          DesktopProyect(
            assetImages: const [
              'assets/images/petto-proyect-1.jpg',
              'assets/images/petto-proyect-2.jpg',
              'assets/images/petto-proyect-3.jpg',
              'assets/images/petto-proyect-4.jpg',
            ],
            title: 'Petto',
            description: AppLocalizations.of(context)!.pettoDescription,
            //
            //
            //
            skills: const ['', 'Flutter', 'Dart', 'Firebase', 'Git', 'SOLID', 'Clean Arquitecture'],
            githubOnTap: () => launchURL('https://github.com/PettoORG/petto_app'),
            playStoreOnTap: () => launchURL('https://play.google.com/store/apps/details?id=com.petto.app'),
          ),
          SizedBox(height: height * .3),
          DesktopProyect(
            assetImages: const [
              'assets/images/mi-proceso-1.jpg',
              'assets/images/mi-proceso-2.jpg',
              'assets/images/mi-proceso-3.jpg',
              'assets/images/mi-proceso-4.jpg',
            ],
            title: 'Mi Proceso',
            description: AppLocalizations.of(context)!.legalProcessInterface,
            skills: const ['', '', '', 'Flutter', 'Dart', 'Git', 'Clean Arquitecture'],
            githubOnTap: () => launchURL('https://github.com/KamiloChinome/Flutter-Mi-Proceso-App'),
          ),
          SizedBox(height: height * .3),
          DesktopProyect(
            assetImages: const [
              'assets/images/cinemapedia-1.jpg',
              'assets/images/cinemapedia-2.jpg',
              'assets/images/cinemapedia-3.jpg',
              'assets/images/cinemapedia-4.jpg',
            ],
            title: 'Cinemapedia',
            description: AppLocalizations.of(context)!.movieAppDescription,
            skills: const ['', 'Flutter', 'Dart', 'API', 'Git', 'SOLID', 'Clean Arquitecture'],
            githubOnTap: () => launchURL('https://github.com/KamiloChinome/FLutter-MovieLand-App'),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .10),
      child: Column(
        children: [
          SharedSectionDivider(text: AppLocalizations.of(context)!.skills),
          SizedBox(height: height * .05),
          GridView.count(
            crossAxisCount: 6,
            shrinkWrap: true,
            children: const [
              SharedLogoSkill(Brands.flutter, 'Flutter'),
              SharedLogoSkill(Brands.dart, 'Dart'),
              SharedLogoSkill(Brands.git, 'Git'),
              SharedLogoSkill(Brands.firebase, 'Firebase'),
              SharedLogoSkill(Brands.docker, 'Docker'),
              SharedLogoSkill(Brands.postgresql, 'PostgreSQL'),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
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
      ),
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
          onPressed: () {
            String url = (context.read<LanguageProvider>().language == 'es')
                ? 'https://firebasestorage.googleapis.com/v0/b/kamilo-chinome.appspot.com/o/CV%20KAMILO%20CHINOME%20ES.pdf?alt=media&token=92b1cbdb-bbad-48e3-a5ca-0d09506ff0f2'
                : 'https://firebasestorage.googleapis.com/v0/b/kamilo-chinome.appspot.com/o/CV%20KAMILO%20CHINOME%20EN.pdf?alt=media&token=ac92a840-31d7-49d9-99b4-a9ad0bb65832';
            launchURL(url);
          },
        ),
        SizedBox(width: width * .03),
      ],
    );
  }
}
