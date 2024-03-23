import 'package:flutter/material.dart';
import 'package:portfolio/project/tag.dart';

class TagRow extends StatelessWidget {
  final String? label;
  final List<ProjectTag> tags;

  const TagRow({
    super.key,
    this.label,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.center,
      children: tags.map((e) => e.asTagChip(context)).toList(),
    );
  }
}
