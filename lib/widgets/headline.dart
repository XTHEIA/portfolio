import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String text;

  const Headline(
    this.iconData,
    this.text, {
    super.key,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(width: 80, child: Divider()),
            ),
            Icon(iconData, color: color),
            const SizedBox(width: 5),
            Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(width: 80, child: Divider()),
            ),
          ],
        ),
      ],
    );
  }
}
