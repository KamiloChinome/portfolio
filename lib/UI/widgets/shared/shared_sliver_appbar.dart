import 'package:flutter/material.dart';

class SharedSliverAppBar extends StatelessWidget {
  const SharedSliverAppBar({super.key, this.leading, this.actions});
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      toolbarHeight: 100,
      leadingWidth: width * .1,
      floating: true,
      leading: leading,
      actions: actions,
    );
  }
}
