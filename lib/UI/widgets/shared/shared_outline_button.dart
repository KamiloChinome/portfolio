import 'package:flutter/material.dart';

class SharedOutlinedButton extends StatelessWidget {
  const SharedOutlinedButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'PixelifySans'),
        ));
  }
}
