import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/project/field.dart';
import 'package:portfolio/project/tag.dart';
import 'package:portfolio/widgets/page_button.dart';
import 'package:portfolio/widgets/tag_row.dart';

class ProfileBox extends StatefulWidget {
  const ProfileBox({super.key});

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  //
  static const fields = Field.values;
  static final fieldsCount = fields.length;

  static const double descWidth = 380;
  static const double prefixFontSize = 24;

  // state
  Timer? cycleTimer, delayTimer;
  int fieldIdx = -1;
  Field? field;
  double width = 380;

  @override
  void initState() {
    super.initState();
    cycleField();
    cycleTimer =
        Timer.periodic(const Duration(seconds: 4), (timer) => cycleField());
  }

  @override
  void dispose() {
    super.dispose();
    cycleTimer?.cancel();
    delayTimer?.cancel();
  }

  void setField(Field? field) {
    setState(() {
      this.field = field;
    });
  }

  void cycleField() {
    // cycle idx
    fieldIdx += 1;
    if (fieldIdx >= fieldsCount) {
      fieldIdx = 0;
    }
    final newField = fields[fieldIdx];
    // change field
    // setField(null);

    setState(() {
      width = descWidth;
    });

    delayTimer = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        field = newField;
        width = 0;
      });
      // setField(newField);
    });
  }

  @override
  Widget build(BuildContext context) {
    final field = this.field;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 720,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Name
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('SBKIM.XTHEiA',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w500)),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13, left: 10),
                    child: Text('세빈', style: TextStyle(color: Colors.white60)),
                  ),
                ],
              ),
              const SizedBox(
                  width: 100, child: Divider(height: 0, color: Colors.white54)),

              const SizedBox(height: 30),
              // Field Descriptions
              SizedBox(
                width: descWidth,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    // Content
                    Container(
                      child: field == null
                          ? const SizedBox()
                          : Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          // Prefix + Development
                          Row(
                            children: [
                              // prefix
                              Row(
                                children: [

                                  Icon(field.tabIcon,
                                      color: field.colors.first),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${field.prefix} ',
                                    style: TextStyle(
                                      fontSize: prefixFontSize,
                                      fontWeight: FontWeight.w500,
                                      color: field.colors.first,
                                    ),
                                  ),
                                ],
                              ),

                              // dev
                              const Text(

                                '제작',
                                style: TextStyle(
                                    fontSize: prefixFontSize,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),

                          SizedBox(height: 5),
                          Text(
                            field.prefixDesc,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70),

                          ),
                        ],
                      ),
                    ),
                    // Paint
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOutExpo,
                      color: backgroundColor,
                      width: width,
                      height: 125,
                    ),
                  ],
                ),
              ),
            ]),

            // right
            SizedBox.square(
              dimension: 240,
              child: Image.asset('assets/images/sbxt_transparent.png'),
            )
          ],
        ),
      ),
    );
  }
}
