import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/project/field.dart';
import 'package:portfolio/utils/text.dart';
import 'package:portfolio/widgets/field_title.dart';

class Hub extends StatefulWidget {
  const Hub({super.key});

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  Field currentTab = Field.server;
  Field? hoveringTab;

  @override
  Widget build(BuildContext context) {
    final currentTab = this.currentTab;
    return Column(
      children: [
        // Tab Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Field.values.map((tab) {
            final isSelected = tab == currentTab;
            final isHoverring = hoveringTab == tab;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: InkWell(
                hoverColor: tab.colors.first.withOpacity(0.1),
                splashColor: Colors.transparent,
                onTap: () => setState(() => this.currentTab = tab),
                onHover: (b) => setState(() => hoveringTab = b ? tab : null),
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
                                tab.tabIcon,
                                size: 20,
                                color:
                                    isSelected ? tab.colors.first : Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: text(
                                  tab.label,
                                  size: 15,
                                  color: isSelected ? null : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: isSelected
                                  ? tab.colors
                                  : tab.colors
                                      .map((c) =>
                                          Color.lerp(c, Colors.grey, 0.7)!)
                                      .toList(),
                            ),
                          ),
                          height: 3,
                          width: 140 + (isSelected ? 10 : isHoverring ? 5 : 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const Divider(height: 0),
        const SizedBox(height: 10),

        // Tab View
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 55),
          child: SizedBox(
            width: maxWidth,
            child: Column(
              children: [
                FieldTitle(
                  isPrimary: currentTab.isPrimary,
                  color: currentTab.colors.first,
                  icon: currentTab.titleIcon,
                  titleHl: currentTab.title,
                  title: ' 제작',
                ),
                const SizedBox(height: 15),
                currentTab.widget,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
