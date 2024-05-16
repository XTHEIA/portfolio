import 'package:flutter/material.dart';
import 'package:portfolio/widgets/hub/tabs/app.dart';
import 'package:portfolio/widgets/hub/tabs/plugin.dart';
import 'package:portfolio/widgets/hub/tabs/server.dart';
import 'package:portfolio/widgets/hub/tabs/web.dart';

enum Field {
  server(
    '커스텀 마크 서버',
    Icons.dns,
    [Colors.cyanAccent, Colors.blueAccent],
    ServerHubTab(),
    isPrimary: true,
    title: '커스텀 서버',
    titleIcon: Icons.dashboard_customize,
    prefix: '마인크래프트 서버',
    prefixDesc: '다양한 종류의 마인크래프트 서버 제작\n\n최적화된 커스텀 서버 100% 맞춤 제작\n(스트리밍 컨텐츠, 시청자 참여, 유튜브 영상 등)',
  ),
  pluginMod(
    '플러그인 / 모드',
    Icons.extension,
    [Colors.pinkAccent, Colors.orange],
    PluginHubTab(),
    isPrimary: true,
    prefix: '마인크래프트 플러그인/모드',
    prefixDesc: '폭넓고 강력한 기능의 마인크래프트 플러그인 혹은 모드 제작\n\nDB 연동, API 사용 등 특수 기능 지원\n다중 서버 대상 지원 (Bungeecord, Velocity 등)',
  ),
  app(
    '앱 / 프로그램',
    Icons.apps,
    [Colors.greenAccent, Colors.yellowAccent],
    AppHubTab(),
    prefix: '모바일 앱 / 데스크탑 프로그램',
    prefixDesc: '모바일, 데스크탑 모두 호환 가능한 프로그램의 개발\n\n마인크래프트 서버 연동 기능 제공\n(데이터 연동 / 아이템, 퍼미션 지급 등 특수 기능)',
  ),
  bot(
    '디스코드 봇',
    Icons.discord,
    [Color(0xFF7289da), Colors.purpleAccent],
    SizedBox(),
    prefixDesc: '고성능 디스코드 봇 개발\n\n마인크래프트 서버 연동 기능 제공\n(데이터 연동 / 아이템, 퍼미션 지급 등 특수 기능)',
  ),
  web(
    '웹사이트',
    Icons.public,
    [Colors.yellow, Colors.white],
    WebHubTab(),
    prefix: '고급 웹사이트',
    prefixDesc: '다양한 기능을 포함한 웹사이트 개발\n\n마인크래프트 서버 연동 기능 제공\n(데이터 연동 / 아이템, 퍼미션 지급 등 특수 기능)',
  ),
  ;

  final bool isPrimary;
  final IconData tabIcon, titleIcon;
  final String label, title, prefix, prefixDesc;
  final List<Color> colors;
  final Widget widget;

  const Field(
    this.label,
    this.tabIcon,
    this.colors,
    this.widget, {
    this.isPrimary = false,
    String? title,
    String? prefix,
    IconData? titleIcon,
    required this.prefixDesc,
  })  : title = title ?? label,
        titleIcon = titleIcon ?? tabIcon,
        prefix = prefix ?? label;
}
