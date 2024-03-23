import 'package:flutter/material.dart';
import 'package:portfolio/project/tag.dart';
import 'package:portfolio/widgets/tag_row.dart';

class FieldsMainTab extends StatelessWidget {
  const FieldsMainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _fieldChips;
  }
}

const _fieldChips = SizedBox(
  width: 320,
  child: Column(
    children: [
      // Primary
      TagRow(tags: [
        ProjectTag.minecraft_server,
        ProjectTag.minecraft_plugin,
        ProjectTag.minecraft_mod,
      ]),
      SizedBox(height: 10),

      // Secondary
      TagRow(tags: [
        ProjectTag.discord_bot,
        ProjectTag.desktop_app,
        ProjectTag.mobile_app,
        ProjectTag.web,
      ]),

      // Line
      Divider(),

      // Platforms
      TagRow(tags: [
        ProjectTag.minecraft,
        ProjectTag.flutter,
        ProjectTag.unity3d,
      ]),

      SizedBox(height: 10),

      // Language
      TagRow(tags: [
        ProjectTag.kotlin,
        ProjectTag.java,
        ProjectTag.csharp,
        ProjectTag.dart,
      ]),
    ],
  ),
);

final _legacy = Container(
  height: 500,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile image
          Image.asset(
            'assets/images/sbxt_transparent.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 5),
          const Text(
            'SBKIM.XTHEiA',
            style: TextStyle(fontSize: 23),
          ),

          const Text('마인크래프트 서버를 위주로 개발하고 있습니다.'),

          const SizedBox(height: 30),

          // 깔끔하게 이 메뉴만 둘까?

          const SizedBox(height: 30),

          // Field Chips
        ],
      ),
    ],
  ),
);
