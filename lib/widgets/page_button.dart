import 'package:flutter/material.dart';

class PageButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final void Function() onTap;

  const PageButton(
    this.icon,
    this.label,
    this.onTap, {
    super.key,
  });

  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(widget.icon, color: Colors.cyanAccent, size: 23);
    return InkWell(
      onHover: (b) => setState(() => this.isHovering = b),
      onTap: widget.onTap,
      child: AnimatedSize(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeOutQuart,
        child: Container(
          height: 35,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: isHovering
              ? const BoxDecoration(
                  color: Color(0xFF404040),
                  boxShadow: [BoxShadow(offset: Offset(1, 1), blurRadius: 3)],
                )
              : null,
          child: isHovering
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconWidget,
                    SizedBox(width: 8),
                    Text(widget.label, style: TextStyle(fontSize: 16)),
                  ],
                )
              : iconWidget,
        ),
      ),
    );
  }
}
