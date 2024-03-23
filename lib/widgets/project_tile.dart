import 'package:flutter/material.dart';
import 'package:portfolio/project/project.dart';
import 'package:portfolio/project/tag.dart';
import 'package:portfolio/utils/text.dart';

class ProjectTile extends StatelessWidget {
  static const double _IMG_RATIO = 280 / 530;
  static const double defaultWidth = 350;

  //
  final Widget image;
  final Widget logo;
  final String title, description;
  final List<ProjectTag> tags;
  final double width;
  final Color? color;
  final void Function(BuildContext)? onTap;
  final bool showFirstTag;

  const ProjectTile({
    super.key,
    required this.image,
    required this.logo,
    required this.title,
    this.width = 350,
    required this.description,
    required this.tags,
    this.showFirstTag = true,
    this.color,
    this.onTap,
  });

  ProjectTile.of(
    Project project, {
    super.key,
    this.width = 350,
    this.showFirstTag = true,
  })  : image = Image.asset(
          'assets/images/project/${project.id}/img.png',
          errorBuilder: (c, o, s) => Icon(Icons.image, color: project.color),
        ),
        logo = Image.asset(
          'assets/images/project/${project.id}/logo.png',
          errorBuilder: (c, o, s) => Icon(Icons.code, color: project.color),
        ),
        title = project.label,
        description = project.description,
        tags = project.tags,
        color = project.color,
        onTap = project.onTap();

  @override
  Widget build(BuildContext context) {
    final tags = List.of(this.tags);
    final firstTag = tags.removeAt(0);

    return InkWell(
      onTap: onTap == null ? null : () => onTap!(context),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Color.lerp(const Color(0xFF25272C), color, 0.08),
          // borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: color ?? Colors.blueGrey,
            width: 0.7,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          boxShadow: const [BoxShadow(blurRadius: 3, spreadRadius: 2, offset: Offset(1, 1))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Img
            Container(
              height: width * _IMG_RATIO,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  image,
                  showFirstTag
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            color: Colors.black54,
                            child: firstTag.asTagChip(context),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),

            Divider(height: 0, color: color?.withOpacity(0.4) ?? Colors.blueGrey),

            // Description
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            logo,
                            const SizedBox(width: 4),
                            text(title, size: 18, weight: FontWeight.w500),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 12),
                        child: SizedBox(
                            height: 38,
                            child: text(description, size: 14, color: Colors.white.withOpacity(0.76))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: tags
                        .map((t) => Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Transform.scale(
                                scale: 0.9,
                                child: t.asTagChip(context),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectRow extends StatelessWidget {
  final List<Project> projects;
  final double width;
  final Widget? title;
  final WrapAlignment alignment;

  const ProjectRow(
    this.projects, {
    super.key,
    this.width = 350,
    this.title,
    this.alignment = WrapAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: alignment,
      spacing: 12,
      runSpacing: 12,
      children: projects
          .map((p) => ProjectTile.of(
                p,
                width: width,
              ))
          .toList(),
    );
  }
}
