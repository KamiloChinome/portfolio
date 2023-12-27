import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
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
    double height = MediaQuery.of(context).size.height;

    Future scrollToSection(GlobalKey key) async {
      final context = key.currentContext!;
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        alignment: .5,
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
                  _Proyects(key: workKey),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
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
  const _Proyects({super.key});

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
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        children: [
          SharedSectionDivider(text: AppLocalizations.of(context)!.projects),
          SizedBox(height: height * .03),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     Text(
          //       'Petto',
          //       style: textStyle.titleLarge,
          //     ),
          //     Text(
          //       AppLocalizations.of(context)!.featuredProject,
          //       style: textStyle.titleSmall!.copyWith(
          //         fontFamily: 'PixelifySans',
          //         color: colors.secondary,
          //       ),
          //     ),
          //     SizedBox(height: height * .01),
          //     Container(
          //       width: width * .5,
          //       padding: EdgeInsets.all(width * .01),
          //       color: colors.surface,
          //       child: Text(
          //         AppLocalizations.of(context)!.pettoDescription,
          //         textAlign: TextAlign.end,
          //         style: textStyle.bodyLarge,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: height * .25),
          DesktopProyectv2(
            assetImage: 'assets/images/petto-proyect.png',
            title: 'Petto',
            description: AppLocalizations.of(context)!.pettoDescription,
            skills: const ['Flutter', 'Dart', 'Firebase', 'Git', 'SOLID', 'Clean Arquitecture'],
            githubOnTap: () => launchURL('https://github.com/PettoORG/petto_app'),
          ),
          SizedBox(height: height * .3),
          DesktopProyectv1(
            assetImage: 'assets/images/MiProceso-proyect.png',
            title: 'Mi Proceso',
            description: AppLocalizations.of(context)!.legalProcessInterface,
            skills: const ['Flutter', 'Dart', 'Git', 'Clean Arquitecture'],
            githubOnTap: () => launchURL('https://github.com/KamiloChinome/Flutter-Mi-Proceso-App'),
          ),
          SizedBox(height: height * .3),
          DesktopProyectv2(
            assetImage: 'assets/images/cinemapedia-proyect.png',
            title: 'Cinemapedia',
            description: AppLocalizations.of(context)!.movieAppDescription,
            skills: const ['Flutter', 'Dart', 'API', 'Git', 'SOLID', 'Clean Arquitecture'],
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
      padding: EdgeInsets.symmetric(horizontal: width * .13),
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
          onPressed: () => launchURL(
              'https://firebasestorage.googleapis.com/v0/b/kamilo-chinome.appspot.com/o/CV%20KAMILO%20CHINOME.pdf?alt=media&token=00998005-244c-4fec-b761-aa863bad4dee'),
        ),
        SizedBox(width: width * .03),
      ],
    );
  }
}
