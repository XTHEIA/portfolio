import 'package:flutter/material.dart';
import 'package:portfolio/widgets/main_tab/main_tab.dart';
import 'package:portfolio/widgets/top_bar.dart';

import 'utils/text.dart';

void main() {
  runApp(const SBXTPortfolioApp());
}

bool ignoredScreenSizeWarning = false;

const voidColor = Color(0xFF1F2429);
const backgroundColor = Color(0xFF1C1B1F);
const double maxWidth = 1200;
const double minScreenWidth = 680;

class SBXTPortfolioApp extends StatelessWidget {
  const SBXTPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SBKIM.XTHEiA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColorDark: Colors.cyanAccent,
        fontFamily: 'Pretendard',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
        scaffoldBackgroundColor: voidColor,
        tooltipTheme: const TooltipThemeData(
          waitDuration: Duration(milliseconds: 200),
        ),
      ),
      home: const PortfolioMain(),
    );
  }
}

class PortfolioMain extends StatefulWidget {
  const PortfolioMain({super.key});

  @override
  State<PortfolioMain> createState() => _PortfolioMainState();
}

class _PortfolioMainState extends State<PortfolioMain> {
  MainTab tab = MainTab.home;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (!ignoredScreenSizeWarning && screenWidth < minScreenWidth) {
      final ratio = screenWidth / minScreenWidth;
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/sbxt_transparent.png', width: 40),
              SizedBox(height: 8),
              const Text(
                '현재 창에서는 본 웹페이지를 올바르게 표시할 수 없습니다.\n'
                '창 크기를 조절하거나 데스크탑을 사용해주세요.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
              //
              SizedBox(height: 40),
              //
              SizedBox(width: 130, child: LinearProgressIndicator(value: ratio, color: Colors.cyanAccent)),
              SizedBox(height: 5),
              Text(
                '현재 창 너비 : ${screenWidth.toInt()}\n'
                '최소 창 너비 : ${minScreenWidth.toInt()}',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              //
              SizedBox(height: 40),
              //
              TextButton(
                onPressed: () => setState(() => ignoredScreenSizeWarning = true),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.cyan.withOpacity(0.5),
                ),
                child: const Text(
                  '무시하고 진행',
                  style: TextStyle(color: Colors.white,fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: voidColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [BoxShadow(offset: Offset(0, 6), blurRadius: 5, spreadRadius: 0.5)],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: TopBar.height + 4),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 100, left: 10, right: 10),
                          child: tab.getWidget(),
                        ),
                      ],
                    ),
                  ),
                ),

                // Contacts
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      text('모든 작업 상담 및 의뢰는 좌측 상단의 "문의 프로필" 탭을 확인해주세요.', size: 13, color: Colors.grey),
                      const SizedBox(height: 15),
                      Image.asset(
                        'assets/images/sbxt_transparent.png',
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Top Navigation Bar
          TopBar(
            tab: tab,
            setTab: (t) => setState(() => tab = t),
          ),
        ],
      ),
    );
  }
}
