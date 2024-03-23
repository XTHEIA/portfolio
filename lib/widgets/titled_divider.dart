import 'package:flutter/material.dart';

class TitledDivider extends StatelessWidget {
  final Widget title;
  final Widget? trailing;
  final Color? color;

  const TitledDivider({
    super.key,
    required this.title,
    this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title,
            trailing ?? const SizedBox(),
          ],
        ),
        Divider(color: color, endIndent: 0, indent: 0),
        const SizedBox(height: 5)
      ],
    );
  }
}
