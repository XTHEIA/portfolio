import 'package:flutter/material.dart';
import 'package:portfolio/project/project.dart';
import 'package:portfolio/project/tag.dart';
import 'package:portfolio/utils/text.dart';
import 'package:portfolio/widgets/project_tile.dart';

class TagPage extends StatelessWidget {
  final ProjectTag tag;

  TagPage(this.tag, {super.key});

  late final projects = Project.searchByTag(tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: tag.tagColor.withOpacity(0.2),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text('"${tag.label}" 관련 프로젝트'),
            tag.asTagChip(context),
          ],
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
                child: ProjectRow(
              projects,
              width: 320,
              alignment: WrapAlignment.start,
            )),
          ),
        ),
      ),
    );
  }

  static Future<T?> push<T>(BuildContext context, ProjectTag tag) {
    return Navigator.push<T?>(context, MaterialPageRoute(builder: (context) => TagPage(tag)));
  }
}
