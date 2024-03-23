import 'package:flutter/material.dart';
import 'package:portfolio/project/project.dart';
import 'package:portfolio/widgets/project_tile.dart';

class WebHubTab extends StatelessWidget {
  const WebHubTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectRow([
          Project.server_engine_web,
          Project.league_archive,
        ]),
      ],
    );
  }
}
