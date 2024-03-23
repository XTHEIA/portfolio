import 'package:flutter/material.dart';

import '../utils/text.dart';

class TagChip extends StatelessWidget {
  //
  final Widget leading;
  final String label;
  final Color color;
  final double backgroundOpacity;
  final void Function()? onTap;

  const TagChip(
    this.leading,
    this.label, {
    super.key,
    this.color = Colors.white,
    this.backgroundOpacity = 0.2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(backgroundOpacity),
          // borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color, width: 0.7),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(dimension: 20, child: leading),
            const SizedBox(width: 6),
            text(
              label,
              weight: FontWeight.w500,
              size: 15,
              letterSpacing: -0.15,
            ),
          ],
        ),
      ),
    );
  }
}
