import 'package:flutter/material.dart';
import 'package:portfolio/profile/contact.dart';
import 'package:portfolio/utils/text.dart';
import 'package:portfolio/widgets/hover_tile.dart';
import 'package:portfolio/widgets/main_tab/main_tab.dart';
import 'package:portfolio/widgets/profile_tile.dart';

class TopBar extends StatelessWidget {
  static const double height = 60;
  final MainTab tab;
  final void Function(MainTab) setTab;

  const TopBar({
    super.key,
    required this.tab,
    required this.setTab,
  });

  static final title = HoverTile(
    color: Colors.cyanAccent,
    idleWidth: 145,
    idleWidget: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Image.asset('assets/images/sbxt_transparent.png', width: 40),
          const SizedBox(width: 5),
          text('SBXT', size: 31),
        ],
      ),
    ),
    hoverWidth: 290,
    hoverWidget: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Image.asset('assets/images/sbxt_transparent.png', width: 40),
          const SizedBox(width: 5),
          text('SBKIM.XTHEiA', size: 31),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final leftChildren = <Widget>[];
    for (final t in MainTab.values) {
      leftChildren.add(HoverTile(
        idleWidget: Icon(t.icon, color: tab == t ? Colors.cyanAccent : Colors.white),
        hoverWidget: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            t.label,
            style: TextStyle(color: tab == t ? Colors.cyanAccent : Colors.white, fontSize: 14),
          ),
        ),
        onTap: () => setTab(t),
      ));
      leftChildren.add(const SizedBox(width: 5));
    }
    leftChildren.removeLast();

    return Material(
      child: Container(
        height: TopBar.height,
        decoration: const BoxDecoration(
          color: Color(0xFF1C1B1F),
          boxShadow: [BoxShadow(offset: Offset(0, 8), blurRadius: 15)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: leftChildren,
            ),

            // Center
            Image.asset('assets/images/sbxt_transparent.png', width: 40),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ProfileTile.contact(Contact.youtube_channel),
                const SizedBox(width: 5),
                ProfileTile.contact(Contact.discord_profile),
                // const SizedBox(width: 5),
                // ProfileTile.contact(Contact.kmong_profile),
                const SizedBox(width: 5),
                ProfileTile.contact(Contact.github_profile),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
