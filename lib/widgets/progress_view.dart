import 'dart:async';

import 'package:flutter/material.dart';

class ProgressView extends StatefulWidget {
  final List<ProgressStep> steps;
  final Color color;

  const ProgressView({
    super.key,
    required this.steps,
    this.color = Colors.tealAccent,
  });

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  late final steps = widget.steps;
  late final stepsCount = steps.length;

  // late final hasBody = steps.any((s) => s.body != null);
  late final color = widget.color;
  late final tileColor = const Color(0xFF333236);
  late final selectedTileColor = Color.lerp(const Color(0xFF1C1B1F), color, 0.1);

  Timer? timer;
  int currentIndex = 0;
  double nextInterval = 4;
  double nextTime = 0;

  void changeIndex(int i) {
    setState(() {
      currentIndex = i;
      nextTime = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        nextTime += 0.01;
        if (nextTime > nextInterval) {
          nextTime = -0.5;
          currentIndex += 1;
          if (currentIndex >= stepsCount) {
            currentIndex = 0;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final blocks = <Widget>[];
    for (int i = 0; i < stepsCount; i++) {
      final step = steps[i];
      final isHighlighted = nextTime > 0 && currentIndex == i;
      blocks.add(AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutQuart,
        child: InkWell(
          onTap: () => changeIndex(i),
          splashColor: color.withOpacity(0.2),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isHighlighted ? selectedTileColor : tileColor,
                  borderRadius: BorderRadius.circular(2),
                  // border: Border.all(color: color, width: 0.4),
                  boxShadow: const [BoxShadow(offset: Offset(1, 1), blurRadius: 2)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(step.iconData, size: 18, color: color),
                        const SizedBox(width: 6),
                        Text(
                          step.name,
                          style:const TextStyle(
                            fontSize: 16,
                            fontWeight:  FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    // Body
                    !isHighlighted
                        ? const SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                step.description,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              step.body ?? const SizedBox(),
                            ],
                          ),
                  ],
                ),
              ),
              isHighlighted
                  ? LinearProgressIndicator(
                      color: color,
                      value: nextTime / nextInterval,
                      minHeight: 1,
                      backgroundColor: Colors.black87,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ));
      blocks.add(const SizedBox(height: 10));
    }
    blocks.removeLast();

    return SizedBox(
      width: 425,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: blocks,
          ),
          // LinearProgressIndicator(color: color, value: nextTime / nextInterval, minHeight: 0.8),
        ],
      ),
    );
  }
}

class ProgressStep {
  final String name;
  final IconData iconData;
  final String description;
  final Widget? body;

  ProgressStep(
    this.name,
    this.iconData,
    this.description, {
    this.body,
  });
}
