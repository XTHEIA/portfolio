import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/text.dart';

class FieldTitle extends StatefulWidget {
  //
  final bool isPrimary;
  final IconData icon;
  final String titleHl, title;
  final Color color;

  const FieldTitle({
    super.key,
    required this.color,
    this.isPrimary = false,
    required this.icon,
    required this.titleHl,
    required this.title,
  });

  @override
  State<FieldTitle> createState() => _FieldTitleState();
}

class _FieldTitleState extends State<FieldTitle> {
  Timer? timer;
  double animationFactor = 0;
  double starRotation = 0, starScale = 1;

  @override
  void initState() {
    super.initState();
    if (widget.isPrimary) {
      timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        animationFactor += 0.01;

        if (animationFactor > 1) {
          animationFactor = -1.3;
        } else if (animationFactor >= 0) {
          setState(() {
            starRotation = animationFactor * 6.28319;
            // 0 ~ 1
            // -0.5 ~ 0.5
            // 0.5 ~ 0 ~ 0.5
            starScale = 1 + (1.3 * (0.5 - (animationFactor - 0.5).abs()));
          });
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 3),
        Row(
          children: [
            Icon(widget.icon, size: 34, color: widget.color),
            const SizedBox(width: 7),
            text(widget.titleHl, size: 35, bold: true, color: widget.color),
          ],
        ),
        text(widget.title, size: 35, weight: FontWeight.w500),
        widget.isPrimary
            ? Tooltip(
                message: '집중적으로 다루는 분야입니다.',
                child: Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Transform.rotate(
                    angle: starRotation,
                    child: Transform.scale(
                      scale: starScale,
                      child: Icon(Icons.star, size: 15, color: Colors.yellow),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
