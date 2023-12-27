import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/UI/widgets/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DeviceScreenType deviceType = getDeviceType(MediaQuery.of(context).size);
    int axisCount = (deviceType == DeviceScreenType.desktop) ? 3 : 1;
    double aspectRatio = (deviceType == DeviceScreenType.desktop) ? 2 : 3;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SharedSectionDivider(text: AppLocalizations.of(context)!.contact),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: width * .03,
            mainAxisSpacing: width * .03,
            childAspectRatio: aspectRatio,
            shrinkWrap: true,
            crossAxisCount: axisCount,
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
          ),
        ],
      ),
    );
  }
}
