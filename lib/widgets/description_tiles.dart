import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  final List<Widget> items;

  CardGrid({
    super.key,
    required List<Widget> items,
    double? height = 100,
    double? width = 350,
  }) : items = items
            .map((e) => SizedBox(
                  height: height,
                  width: width,
                  child: e,
                ))
            .toList();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 15,
      children: items,
    );
  }
}

// class CardItem {
//   final Widget leading, title, description;
//   final double? height,width;
//
//   CardItem({
//     required this.leading,
//     required this.title,
//     required this.description,
//     this.height,
//     this.width,
//   });
//
//   CardItem({
//     Widget? leading,
//     IconData? leadingIconData,
//     Widget? title,
//     String? titleText,
//     Widget? description,
//     String? descriptionText,
//     this.height,
//     this.width,
// }):
//       leading = leading ?? Icon(leadingIconData,size: 22),
//   title = title ?? text(titleText)
//
//
//
//
// }
