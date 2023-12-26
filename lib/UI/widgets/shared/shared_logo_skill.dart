import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SharedLogoSkill extends StatelessWidget {
  final String brandLogo;
  final String text;
  const SharedLogoSkill(this.brandLogo, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Brand(
          brandLogo,
          size: width * .05,
        ),
        Text(
          text,
          style: textStyle.titleSmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
