import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/models/job_model.dart';

class JobCard extends StatefulWidget {
  final Job job;
  const JobCard({super.key, required this.job});

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) {
        pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      onExit: (_) {
        pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      child: Container(
        padding: EdgeInsets.all(width * .01),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(width * .01),
        ),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: pageController,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.job.jobTitle,
                  style: textStyle.titleLarge!.copyWith(color: colors.secondary, fontFamily: 'PixelifySans'),
                ),
                SizedBox(height: height * .01),
                Text(
                  widget.job.companyName,
                  style: textStyle.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * .01),
                Text(
                  widget.job.period,
                  style: textStyle.titleLarge,
                ),
                SizedBox(height: height * .01),
                Icon(
                  BoxIcons.bx_chevrons_down,
                  size: width * .05,
                )
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.job.contributions.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: height * .02),
                    child: Row(
                      children: [
                        Icon(
                          BoxIcons.bx_right_arrow,
                          size: width * .01,
                          color: colors.secondary,
                        ),
                        SizedBox(width: width * .01),
                        Expanded(
                          child: Text(
                            widget.job.contributions[index],
                            style: textStyle.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
