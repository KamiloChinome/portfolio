import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/colors.dart';
class SharedTextButton extends StatefulWidget {
  const SharedTextButton({
    super.key, required this.text,
  });
  final String text;

  @override
  State<SharedTextButton> createState() => _SharedTextButtonState();
}

class _SharedTextButtonState extends State<SharedTextButton> {
  late Color color = blanco;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(color)),
      onPressed: () {},
      child: Text(widget.text),
      onHover: (value) {
        setState(() {
          color = (value == true) ? Theme.of(context).colorScheme.secondary : blanco;
        });
      } 
    );
  }
}