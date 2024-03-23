import 'package:flutter/material.dart';
import 'package:portfolio/utils/text.dart';

class DescriptionCard extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String title;
  final Widget body;

  static const _greyDeco = BoxDecoration(
    color: Color(0xFF333236),
    boxShadow: [BoxShadow(offset: Offset(1, 1), blurRadius: 2)],
  );

  const DescriptionCard(
    this.iconData,
    this.title, {
    this.color = Colors.white,
    super.key,
    required this.body,
  });

  DescriptionCard.text(
    this.iconData,
    this.title,
    String bodyText, {
    super.key,
    this.color = Colors.white,
  }) : body = Text(bodyText,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(0.8),
            ));

  // Deco Legacy
  // BoxDecoration(
  // color: Color.lerp(color, const Color(0xFF1C1B1F), 0.93),
  // border: Border.all(color: color, width: 0.5),
  // boxShadow: [BoxShadow(offset: Offset(1, 1), blurRadius: 2)],
  // )

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.lerp(color, const Color(0xFF1C1B1F), 0.9),
        // border: Border.all(color: color, width: 0.5),
        boxShadow: [BoxShadow(offset: Offset(1, 1), blurRadius: 2)],
      ),
      padding: const EdgeInsets.all(11.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                size: 19,
                color: color,
              ),
              const SizedBox(width: 7),
              text(title, size: 16, bold: true),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            child: body,
          ),
        ],
      ),
    );
  }
}
