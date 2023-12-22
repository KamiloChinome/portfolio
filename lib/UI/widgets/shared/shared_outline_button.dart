import 'package:flutter/material.dart';

class SharedOutlinedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const SharedOutlinedButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'PixelifySans'),
        ));
  }
}
