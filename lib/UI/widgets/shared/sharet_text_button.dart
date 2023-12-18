import 'package:flutter/material.dart';

class SharedTextButton extends StatefulWidget {
  const SharedTextButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<SharedTextButton> createState() => _SharedTextButtonState();
}

class _SharedTextButtonState extends State<SharedTextButton> {
  late Color color;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    color = Theme.of(context).colorScheme.onBackground;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textStyles = Theme.of(context).textTheme;
    return TextButton(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(color), textStyle: MaterialStatePropertyAll(textStyles.titleSmall)),
      onPressed: () {},
      child: Text(widget.text),
      onHover: (value) {
        setState(
          () {
            color =
                (value == true) ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.onBackground;
          },
        );
      },
    );
  }
}
