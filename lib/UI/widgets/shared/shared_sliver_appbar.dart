import 'package:flutter/material.dart';

class SharedSliverAppBar extends StatelessWidget {
  const SharedSliverAppBar({super.key, this.leading, this.actions});
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      toolbarHeight: height * .15,
      leadingWidth: width * .1,
      floating: true,
      leading: leading,
      actions: actions,
    );
  }
}
