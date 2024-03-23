import 'package:flutter/material.dart';

class HoverTile extends StatefulWidget {

  static const double defaultIdleWidth = 58;
  final Color color;
  final Widget idleWidget, hoverWidget;
  final double idleWidth, hoverWidth, height;
  final void Function()? onTap;

  const HoverTile({
    super.key,
    this.color = Colors.cyanAccent,
    required this.idleWidget,
    required this.hoverWidget,
    this.idleWidth = defaultIdleWidth,
    this.hoverWidth = 120,
    this.height = 60,
    this.onTap,
  });

  @override
  State<HoverTile> createState() => _HoverTileState();
}

class _HoverTileState extends State<HoverTile> {
  late final color = widget.color;
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (b) => setState(() => isHovering = b),
      onTap: widget.onTap ?? () {},
      hoverColor: Colors.transparent,
      splashColor: color.withOpacity(0.15),
      highlightColor: Colors.transparent,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutQuart,
        child: Container(
          height: widget.height,
          width: isHovering ? widget.hoverWidth : widget.idleWidth,
          decoration: BoxDecoration(
            gradient: isHovering
                ? LinearGradient(
                    colors: [Colors.transparent, widget.color],
                    stops: const [0.25, 1],
                    transform: const GradientRotation(1.5708),
                  )
                : null,
            // boxShadow: const [BoxShadow(offset: Offset(1, 1), spreadRadius: 0.5, blurRadius: 2)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: isHovering ? widget.hoverWidget : widget.idleWidget,
                ),
              ),
              Divider(height: 0, color: color, thickness: 1.5),
            ],
          ),
        ),
      ),
    );
  }
}
