import 'package:flutter/material.dart';
import 'package:portfolio/UI/widgets/animations/rotation_folower_animation.dart';

class ImageProyect extends StatelessWidget {
  final String asset;
  const ImageProyect({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RotatorFollower(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width * .01),
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
          width: width * .15,
        ),
      ),
    );
  }
}
