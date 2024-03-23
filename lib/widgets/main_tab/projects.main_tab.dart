import 'package:flutter/material.dart';
import 'package:portfolio/project/project.dart';
import 'package:portfolio/project/tag.dart';
import 'package:portfolio/widgets/pages/tag_search_page.dart';
import 'package:portfolio/widgets/project_tile.dart';
import 'package:portfolio/widgets/titled_divider.dart';

class ProjectsMainTab extends StatelessWidget {
  const ProjectsMainTab({super.key});

  static const tags = ProjectTag.values;
  static const allProjects = Project.values;

  @override
  Widget build(BuildContext context) {
    final blocks = <Widget>[];
    for (var tag in tags) {
      //
      final projects = allProjects.where((p) => p.firstTag() == tag);
      if (projects.isEmpty) continue;

      blocks.add(Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          TitledDivider(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 5),
                    tag.leading(),
                    const SizedBox(width: 7),
                    Text(
                      tag.label,
                      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Text(
                  '${projects.length}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            trailing: Material(
              child: Tooltip(
                message: '관련 프로젝트 모두 보기',
                child: InkWell(
                  onTap: () => TagPage.push(context, tag),
                  hoverColor: Colors.white12,
                  child: const Padding(
                    padding: EdgeInsets.all(3),
                    child: Icon(Icons.open_in_new, size: 20, color: Colors.grey),
                  ),
                ),
              ),
            ),
            color: Colors.white38,
          ),

          // Items
          SizedBox(
            width: 1080,
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 15,
              runSpacing: 15,
              children: projects.map((p) => ProjectTile.of(p, showFirstTag: false)).toList(),
            ),
          ),
          SizedBox(height: 50),
        ],
      ));
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 1090,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: blocks,
          ),
        ),
      ),
    );
  }
}
