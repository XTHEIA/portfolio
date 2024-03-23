import 'package:flutter/material.dart';
import 'package:portfolio/widgets/hub/hub.dart';
import 'package:portfolio/widgets/profile_box.dart';

class HomeMainTab extends StatelessWidget {
  const HomeMainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 120),
        ProfileBox(),
        SizedBox(height: 170),
        Hub(),
      ],
    );
  }
}
