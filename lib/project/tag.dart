import 'package:flutter/material.dart';
import 'package:portfolio/images.dart';
import 'package:portfolio/widgets/pages/tag_search_page.dart';
import 'package:portfolio/widgets/tag_chip.dart';

enum ProjectTag {
  // fields
  minecraft_server.image(
    'mc_server',
    '마인크래프트 서버',
    Images.field_minecraft,
    Colors.greenAccent,
    tagLabel: '서버',
  ),
  minecraft_plugin.image(
    'mc_plugin',
    '마인크래프트 플러그인',
    Images.field_minecraft,
    Colors.green,
    tagLabel: '플러그인',
  ),
  minecraft_mod.image(
    'mc_mod',
    '마인크래프트 모드',
    Images.field_minecraft,
    Colors.green,
    tagLabel: '모드',
  ),
  desktop_app.icon(
    'desktop_app',
    '데스크탑 프로그램',
    Icons.desktop_mac_outlined,
    Colors.white,
    tagLabel: '프로그램',
    iconSize: 22,
  ),
  mobile_app.icon(
    'mobile_app',
    '모바일 앱',
    Icons.phone_android,
    Colors.white,
    tagLabel: '앱',
    iconSize: 19,
  ),
  discord_bot.icon(
    'discord_bot',
    '디스코드 봇',
    Icons.discord,
    Color(0xFF7289da),
    tagLabel: '봇',
    iconSize: 22,
  ),
  web.icon(
    'web',
    '웹사이트',
    Icons.public,
    Colors.white,
    tagLabel: '웹',
    iconSize: 19,
  ),

  // platforms
  minecraft.image('minecraft', '마인크래프트', Images.field_minecraft, Colors.green),
  flutter.image('flutter', 'Flutter', Images.field_flutter, Colors.blue),
  unity3d.image('unity3d', 'Unity3D', Images.field_unity3d, Colors.grey),

  // langs
  kotlin.image('kotlin', 'Kotlin', Images.field_kotlin, Colors.purple),
  java.image('java', 'Java', Images.field_java, Colors.orange),
  csharp.image('csharp', 'C#', Images.field_csharp, Colors.deepPurpleAccent),
  dart.image('dart', 'Dart', Images.field_dart, Colors.blue),
  ;

  final String id, label;
  final Images? image;
  final double? iconSize;
  final IconData? icon;
  final bool isLeadingIcon;
  final String tagLabel;
  final Color tagColor;

  const ProjectTag(
    this.id,
    this.label,
    this.tagColor, {
    String? tagLabel,
    this.image,
    this.icon,
    this.iconSize,
  })  : tagLabel = tagLabel ?? label,
        isLeadingIcon = icon != null;

  const ProjectTag.image(
    String id,
    String label,
    Images image,
    Color tagColor, {
    String? tagLabel,
  }) : this(
          id,
          label,
          tagColor,
          tagLabel: tagLabel,
          image: image,
        );

  const ProjectTag.icon(
    String id,
    String label,
    IconData icon,
    Color tagColor, {
    String? tagLabel,
    double? iconSize,
  }) : this(
          id,
          label,
          tagColor,
          tagLabel: tagLabel,
          icon: icon,
          iconSize: iconSize,
        );

  Widget leading() {
    if (isLeadingIcon) {
      return Icon(icon!, size: iconSize, color: tagColor);
    }
    return SizedBox.square(
      dimension: 20,
      child: Image.asset(
        image!.path,
        isAntiAlias: true,
      ),
    );
  }

  Widget asTagChip(BuildContext context) {
    return TagChip(
      leading(),
      tagLabel,
      color: tagColor,
      onTap: () => TagPage.push(context, this),
    );
  }

  // Flutter contains Dart
  // Pl, Mod, Server Contains Minecraft

  static Set<ProjectTag>? getChildren(ProjectTag parent) {
    switch (parent) {
      case ProjectTag.flutter:
        return const {ProjectTag.dart};
      case ProjectTag.unity3d:
        return const {csharp};
      case ProjectTag.minecraft_server:
      case ProjectTag.minecraft_plugin:
      case ProjectTag.minecraft_mod:
        return const {ProjectTag.minecraft};
      default:
        return null;
    }
  }

  static bool isChildOf(ProjectTag parent, ProjectTag child) {
    return true == getChildren(parent)?.contains(child);
  }
}
