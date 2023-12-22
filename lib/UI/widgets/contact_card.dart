import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  const ContactCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(width * .01),
      width: width * .2,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(width * .01),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: width * .03,
            color: colors.secondary,
          ),
          Text(title, style: textStyle.titleLarge),
          SizedBox(height: height * .01),
          Text(description, style: textStyle.titleMedium),
        ],
      ),
    );
  }
}
