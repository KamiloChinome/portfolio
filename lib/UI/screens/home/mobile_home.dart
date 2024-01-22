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
    double width = MediaQuery.of(context).size.width;

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
        elevation: 10,
        width: width * .6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SharedTextButton(
              text: AppLocalizations.of(context)!.about,
              onPressed: () => scrollToSection(aboutKey),
            ),
            SizedBox(height: height * .01),
            SharedTextButton(
              text: AppLocalizations.of(context)!.skills,
              onPressed: () => scrollToSection(skillsKey),
            ),
            SizedBox(height: height * .01),
            SharedTextButton(
              text: AppLocalizations.of(context)!.projects,
              onPressed: () => scrollToSection(proyectsKey),
            ),
            SizedBox(height: height * .01),
            SharedTextButton(
              text: AppLocalizations.of(context)!.experience,
              onPressed: () => scrollToSection(experienceKey),
            ),
            SizedBox(height: height * .01),
            SharedTextButton(
              text: AppLocalizations.of(context)!.contact,
              onPressed: () => scrollToSection(contactKey),
            ),
            SizedBox(height: height * .01),
            SharedOutlinedButton(
              text: AppLocalizations.of(context)!.resume,
              onPressed: () => launchURL(
                'https://firebasestorage.googleapis.com/v0/b/kamilo-chinome.appspot.com/o/CV%20KAMILO%20CHINOME.pdf?alt=media&token=00998005-244c-4fec-b761-aa863bad4dee',
              ),
            ),
            SizedBox(height: height * .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                // SharedIconButton(
                //   icon: IonIcons.logo_instagram,
                //   onTap: () {
                //     launchURL('https://www.instagram.com/kmilo_chinome');
                //   },
                // ),
              ],
            )
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
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SharedSectionDivider(text: AppLocalizations.of(context)!.workExperience),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .10),
          child: SharedSectionDivider(text: AppLocalizations.of(context)!.projects),
        ),
        SizedBox(height: height * .05),
        MobileProyect(
          assetImages: const [
            'assets/images/petto-proyect-1.jpg',
            'assets/images/petto-proyect-2.jpg',
            'assets/images/petto-proyect-3.jpg',
            'assets/images/petto-proyect-4.jpg',
          ],
          title: 'Petto',
          description: AppLocalizations.of(context)!.pettoDescription,
          skills: const ['Flutter', 'Dart', 'Firebase', 'Git', 'SOLID', 'Clean Arquitecture'],
          githubOnTap: () => launchURL('https://github.com/PettoORG/petto_app'),
          playStoreOnTap: () => launchURL('https://play.google.com/store/apps/details?id=com.petto.app'),
        ),
        SizedBox(height: height * .05),
        MobileProyect(
          assetImages: const [
            'assets/images/mi-proceso-1.jpg',
            'assets/images/mi-proceso-2.jpg',
            'assets/images/mi-proceso-3.jpg',
            'assets/images/mi-proceso-4.jpg',
          ],
          title: 'Mi Proceso',
          description: AppLocalizations.of(context)!.legalProcessInterface,
          skills: const ['Flutter', 'Dart', 'Git', 'Clean Arquitecture'],
          githubOnTap: () => launchURL('https://github.com/KamiloChinome/Flutter-Mi-Proceso-App'),
        ),
        SizedBox(height: height * .05),
        MobileProyect(
          assetImages: const [
            'assets/images/cinemapedia-1.jpg',
            'assets/images/cinemapedia-2.jpg',
            'assets/images/cinemapedia-3.jpg',
            'assets/images/cinemapedia-4.jpg',
          ],
          title: 'Cinemapedia',
          description: AppLocalizations.of(context)!.movieAppDescription,
          skills: const ['Flutter', 'Dart', 'API', 'Git', 'SOLID', 'Clean Arquitecture'],
          githubOnTap: () => launchURL('https://github.com/KamiloChinome/FLutter-MovieLand-App'),
        ),
      ],
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SharedSectionDivider(text: AppLocalizations.of(context)!.skills),
          SizedBox(height: height * .03),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
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
              SharedLogoSkill(Brands.postgresql, 'Postgre\nSQL'),
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
