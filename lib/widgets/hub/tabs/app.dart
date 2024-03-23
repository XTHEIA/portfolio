import 'package:flutter/material.dart';
import 'package:portfolio/project/project.dart';
import 'package:portfolio/utils/text.dart';
import 'package:portfolio/widgets/project_tile.dart';

class AppHubTab extends StatelessWidget {
  const AppHubTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        text('모바일 앱, 데스크톱 프로그램 제작', color: Colors.grey),
        const SizedBox(height: 50),
        ProjectRow(
          [
            Project.server_engine,
            Project.server_lister,
            Project.celestial_tracker,
          ],
        ),
      ],
    );
  }
}
