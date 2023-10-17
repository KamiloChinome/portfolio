import 'package:flutter/material.dart';

class SharedSliverAppBar extends StatelessWidget {
  const SharedSliverAppBar({super.key, this.leading, this.actions});
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 90,
      leadingWidth: 140,
      floating: true,
      // shadowColor: Colors.black,
      leading: leading,
      actions: actions,
    );
  }
}
