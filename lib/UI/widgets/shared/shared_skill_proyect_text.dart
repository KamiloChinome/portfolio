import 'package:flutter/material.dart';

class SharedSkillProyectText extends StatelessWidget {
  final String skill;
  const SharedSkillProyectText(
    this.skill, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textStyles = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Text(
      skill,
      style: textStyles.titleSmall!.copyWith(color: colors.onBackground.withOpacity(.5)),
    );
  }
}
