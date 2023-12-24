import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/UI/widgets/widgets.dart';
import 'package:portfolio/models/job_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutKey = GlobalKey();
    final proyectsKey = GlobalKey();
    final skillsKey = GlobalKey();
    final experienceKey = GlobalKey();
    final contactKey = GlobalKey();
    double height = MediaQuery.of(context).size.height;

    Future scrollToSection(GlobalKey key) async {
      final sectionCContext = key.currentContext!;
      context.pop();
      await Scrollable.ensureVisible(
        sectionCContext,
        duration: const Duration(milliseconds: 500),
        alignment: .5,
      );
    }

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

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _SliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: height * .05),
                AboutMe(key: aboutKey),
                SizedBox(height: height * .1),
                _Skills(key: skillsKey),
                SizedBox(height: height * .1),
                _Proyects(key: proyectsKey),
                SizedBox(height: height * .1),
                _Experience(key: experienceKey),
                SizedBox(height: height * .1),
                Contact(key: contactKey),
                SizedBox(height: height * .05),
                const _SocialMedia(),
                SizedBox(height: height * .05),
              ],
            ),
          )
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SharedTextButton(
              text: AppLocalizations.of(context)!.about,
              onPressed: () => scrollToSection(aboutKey),
            ),
            SharedTextButton(
              text: AppLocalizations.of(context)!.skills,
              onPressed: () => scrollToSection(skillsKey),
            ),
            SharedTextButton(
              text: AppLocalizations.of(context)!.work,
              onPressed: () => scrollToSection(proyectsKey),
            ),
            SharedTextButton(
              text: AppLocalizations.of(context)!.experience,
              onPressed: () => scrollToSection(experienceKey),
            ),
            SharedTextButton(
              text: AppLocalizations.of(context)!.contact,
              onPressed: () => scrollToSection(contactKey),
            ),
            SharedOutlinedButton(
              text: AppLocalizations.of(context)!.resume,
              onPressed: () => launchURL(
                'https://firebasestorage.googleapis.com/v0/b/petto-18ace.appspot.com/o/CV%20KAMILO%20CHINOME.pdf?alt=media&token=1cda18c7-cdbf-4ab0-aa30-15f233dd4b55',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialMedia extends StatelessWidget {
  const _SocialMedia();

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SharedIconButton(
            icon: IonIcons.logo_linkedin,
            onTap: () {
              launchURL('https://www.linkedin.com/in/kamilochinome');
            }),
        SharedIconButton(
            icon: IonIcons.logo_github,
            onTap: () {
              launchURL('https://github.com/KamiloChinome');
            }),
        SharedIconButton(
            icon: IonIcons.logo_instagram,
            onTap: () {
              launchURL('https://www.instagram.com/kmilo_chinome');
            }),
      ],
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
          ...List.generate(jobs.length, (index) => _Job(jobs[index]))
        ],
      ),
    );
  }
}

class _Job extends StatelessWidget {
  final Job job;
  const _Job(this.job);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Container(
      width: width * .7,
      padding: EdgeInsets.all(width * .03),
      margin: EdgeInsets.all(width * .03),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(width * .03),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            job.jobTitle,
            textAlign: TextAlign.center,
            style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
          ),
          SizedBox(height: height * .01),
          Text(
            job.companyName,
            style: textStyle.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * .01),
          Text(
            job.period,
            style: textStyle.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * .02),
          ...List.generate(
            job.contributions.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: height * .02),
              child: Row(
                children: [
                  Icon(
                    BoxIcons.bx_right_arrow,
                    size: width * .03,
                    color: colors.secondary,
                  ),
                  SizedBox(width: width * .02),
                  Expanded(
                    child: Text(
                      job.contributions[index],
                      style: textStyle.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ],
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.projects,
            style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
          ),
          const Divider(),
          SizedBox(height: height * .1),
          MobileProyectv1(
            assetImage: 'assets/images/petto-proyect.png',
            title: 'Petto',
            description: AppLocalizations.of(context)!.pettoDescription,
            skills: const ['Flutter', 'Dart', 'Firebase', 'Git', 'SOLID', 'Clean Arquitecture'],
            githubOnTap: () => launchURL('https://github.com/PettoORG/petto_app'),
          ),
          SizedBox(height: height * .1),
          MobileProyectv2(
            assetImage: 'assets/images/MiProceso-proyect.png',
            title: 'Mi Proceso',
            description: AppLocalizations.of(context)!.legalProcessInterface,
            skills: const ['Flutter', 'Dart', 'Git', 'Clean Arquitecture'],
            githubOnTap: () => launchURL('https://github.com/KamiloChinome/Flutter-Mi-Proceso-App'),
          ),
          SizedBox(height: height * .1),
          MobileProyectv1(
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
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            children: const [
              SharedLogoSkill(Brands.flutter, 'Flutter'),
              SharedLogoSkill(Brands.dart, 'Dart'),
              SharedLogoSkill(Brands.git, 'Git'),
              SharedLogoSkill(Brands.firebase, 'Firebase'),
              //SizedBox) are used to center the elements in the second row.
              SizedBox(),
              SharedLogoSkill(Brands.docker, 'Docker'),
              SharedLogoSkill(Brands.postgresql, 'PostgreSQL'),
              SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SharedSliverAppBar(
      leading: IconButton(
        onPressed: () {},
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        icon: Image.asset(
          'assets/kchLogo.png',
          height: height * .2,
          width: height * .2,
        ),
      ),
      actions: [
        SharedIconButton(
          onTap: () => Scaffold.of(context).openEndDrawer(),
          icon: BoxIcons.bx_menu_alt_right,
        ),
        SizedBox(width: width * .02)
      ],
    );
  }
}
