import 'package:flutter/material.dart';
import 'package:portfolio/project/field.dart';
import 'package:portfolio/utils/text.dart';

class HubTabButton extends StatefulWidget {
  final Field field;
  final bool isSelected;
  final void Function() onTap;

  const HubTabButton({
    super.key,
    required this.onTap,
    required this.field,
    this.isSelected = false,
  });

  @override
  State<HubTabButton> createState() => _HubTabButtonState();
}

class _HubTabButtonState extends State<HubTabButton> {
  bool isHovering = false;
  late final field = widget.field;
  late var isSelected = widget.isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: field.colors.first.withOpacity(0.1),
      splashColor: Colors.transparent,
      onTap: widget.onTap,
      onHover: (b) => setState(() => isHovering = b),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOutQuart,
        child: Container(
          height: 38,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      field.tabIcon,
                      size: 20,
                      color: isSelected ? field.colors.first : Colors.grey,
                    ),
                    isSelected
                        ? Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Row(
                              children: [
                                text(
                                  field.label,
                                  size: 15,
                                  color: isSelected ? null : Colors.grey,
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isSelected
                        ? field.colors
                        : field.colors.map((c) => Color.lerp(c, Colors.grey, 0.7)!).toList(),
                  ),
                ),
                height: 3,
                width: isSelected
                    ? 170
                    : isHovering
                        ? 50
                        : 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
