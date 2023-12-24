import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SharedSliverAppBar extends StatelessWidget {
  const SharedSliverAppBar({super.key, this.leading, this.actions});
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    DeviceScreenType deviceType = getDeviceType(MediaQuery.of(context).size);
    double width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      toolbarHeight: 100,
      leadingWidth: (deviceType == DeviceScreenType.desktop) ? width * .1 : width * .16,
      floating: true,
      leading: leading,
      actions: actions,
    );
  }
}
