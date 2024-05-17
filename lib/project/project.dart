import 'package:flutter/material.dart';
import 'package:portfolio/project/tag.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum Project {
  // Server
  three_kingdoms(
    id: 'three_kingdoms',
    label: '삼국지 서버',
    description: '스트리머별로 3팀을 나누어 경쟁하는 컨텐츠 서버\n실제 스트리밍에 사용됨',
    tags: [ProjectTag.minecraft_server, ProjectTag.minecraft_plugin, ProjectTag.discord_bot, ProjectTag.java],
    color: Colors.orange,
  ),
  pixel_universe(
    id: 'pixel_universe',
    label: 'Pixel Universe',
    description: '커스텀 아이템 기능을 주력으로 한 반야생 서버\n"Entropy" 코어 플러그인 테스트에 사용됨',
    tags: [ProjectTag.minecraft_server, ProjectTag.minecraft_plugin, ProjectTag.kotlin],
    color: Colors.cyanAccent,
  ),

// Plugin, Mod
  simple_discord(
    id: 'simple_discord',
    label: 'SimpleDiscord',
    description: '빠른 설정이 가능한 경량 디스코드 연동 플러그인\n복잡한 봇 생성 과정 불필요',
    tags: [ProjectTag.minecraft_plugin, ProjectTag.kotlin],
    color: Color(0xFF7289da),
    url: 'https://www.curseforge.com/minecraft/bukkit-plugins/simplediscord',
  ),
  pin_engine(
    id: 'pin_engine',
    label: 'Pin Engine',
    description: '몰입형 PIN 입력창을 제공하는 컨테이너 잠금 플러그인',
    tags: [ProjectTag.minecraft_plugin, ProjectTag.kotlin],
    color: Colors.yellowAccent,
    url: 'https://www.curseforge.com/minecraft/bukkit-plugins/pin-engine',
  ),
  better_spyglass(
    id: 'better_spyglass',
    label: 'Better Spyglass',
    description: '엔티티, 블록 데이터 스캔 기능이 추가된 망원경',
    tags: [ProjectTag.minecraft_plugin, ProjectTag.kotlin],
    url: 'https://www.curseforge.com/minecraft/bukkit-plugins/betterspyglass',
// color: Colors.yellowAccent,
  ),
  lethal_scanner(
    id: 'lethal_scanner',
    label: 'Lethal Scanner',
    description: 'Lethal Company의 스캔을 모방한 엔티티, 블록 스캐너',
    tags: [ProjectTag.minecraft_mod, ProjectTag.kotlin],
// color: Colors.redAccent,
  ),
  rechargeable_fireworks(
    id: 'rechargeable_fireworks',
    label: 'Rechargeable Fireworks',
    description: '화로에서 충전 가능한 폭죽 플러그인\n반영구 사용 가능',
    tags: [ProjectTag.minecraft_plugin, ProjectTag.java],
    url: 'https://www.curseforge.com/minecraft/bukkit-plugins/rechargeable-fireworks',
  ),
  nameplate_changer(
    id: 'nameplate_changer',
    label: 'Nameplate Changer',
    description: '플레이어 네임플레이트 변경 플러그인\n플레이어 머리 위 이름 표시 변경 프로토콜',
    tags: [ProjectTag.minecraft_plugin, ProjectTag.java],
    url: 'https://www.spigotmc.org/resources/nameplatechanger.109555/',
  ),

// App
  celestial_tracker(
    id: 'celestial_tracker',
    label: 'Celestial Tracker',
    description: 'NASA 천체 데이터 앱\n소행성 추적, 화성 탐사선 이미지 조회',
    tags: [ProjectTag.mobile_app, ProjectTag.flutter],
    url: 'https://play.google.com/store/apps/details?id=kr.sbxt.xtheia.celestial_tracker',
  ),
  server_engine(
    id: 'server_engine',
    label: 'Server Engine',
    description: 'JE 서버 통합 생성/실행/관리 프로그램\nWindows, macOS 지원',
    tags: [ProjectTag.desktop_app, ProjectTag.flutter, ProjectTag.web],
    color: Colors.greenAccent,
    url: 'https://server-engine.kr/',
  ),
  server_lister(
    id: 'server_lister',
    label: 'SLP',
    description: 'JE 서버 상태 조회 모바일 앱\nMOTD, 플레이어 샘플 조회 가능',
    tags: [ProjectTag.mobile_app, ProjectTag.flutter],
    url: 'https://play.google.com/store/apps/details?id=kr.sbxt.xtheia.server_lister',
  ),

// Web
  server_engine_web(
    id: 'server_engine_web',
    label: 'Server Engine 웹사이트',
    description: 'Server Engine 메인 웹사이트\n다운로드, 패치 노트, 사용법 등 제공',
    tags: [ProjectTag.web, ProjectTag.flutter],
    url: 'https://server-engine.kr/',
  ),
  league_archive(
    id: 'league_archive',
    label: 'League Archive',
    description: '리그 오브 레전드 역대 패치 데이터 조회 웹사이트',
    tags: [ProjectTag.web, ProjectTag.flutter],
    url: 'https://league-archive.kr/',
  );

  final String id, label, description;
  final String? url;
  final List<ProjectTag> tags;
  final Color? color;

  const Project({
    required this.id,
    required this.label,
    required this.description,
    required this.tags,
    this.url,
    this.color,
  });

  ProjectTag firstTag() => tags.first;


  void Function(BuildContext)? getOnTap() {
    if (_getPage(this) case final widget?) {
      return (ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (final ctx) => widget));
    }

    if (url != null) {
      return (ctx) => launchUrlString(url!);
    }

    return null;
  }

  bool hasOrRelatedTag(ProjectTag tag) {
    return tags.contains(tag) || tags.any((element) => ProjectTag.isChildOf(element, tag));
  }

  static List<Project> searchByTag(ProjectTag tag) => values.where((t) => t.hasOrRelatedTag(tag)).toList();

  static Widget? _getPage(Project project) {
    return null;
  }
}
