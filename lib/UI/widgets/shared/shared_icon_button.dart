import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/colors.dart';

class SharedIconButton extends StatefulWidget {
  const SharedIconButton({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  State<SharedIconButton> createState() => _SharedIconButtonState();
}

class _SharedIconButtonState extends State<SharedIconButton> {
  late Color color = blanco;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          color = Theme.of(context).colorScheme.secondary;
        });
      },
      onExit: (event) {
        setState(() {
          color = blanco;
        });
      },
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          widget.icon,
          color: color,
        ),
      ),
    );
  }
}

class SharedTextIconButton extends StatefulWidget {
  const SharedTextIconButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<SharedTextIconButton> createState() => _SharedWidgetButton();
}

class _SharedWidgetButton extends State<SharedTextIconButton> {
  late Color color = blanco;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          setState(() {
            color = Theme.of(context).colorScheme.secondary;
          });
        },
        onExit: (event) {
          setState(() {
            color = blanco;
          });
        },
        child: IconButton(
          onPressed: () {},
          icon: Text(
            widget.text,
            style: TextStyle(color: color, fontFamily: 'PixelifySans'),
          ),
        ));
  }
}
