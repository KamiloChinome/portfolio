import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SharedSectionDivider extends StatelessWidget {
  final String text;
  const SharedSectionDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    DeviceScreenType deviceType = getDeviceType(MediaQuery.of(context).size);
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    double? fontSize = (deviceType == DeviceScreenType.mobile) ? null : 40;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyle.titleLarge!.copyWith(
            color: colors.secondary,
            fontFamily: 'PixelifySans',
            fontSize: fontSize,
          ),
        ),
        const Divider()
      ],
    );
  }
}
