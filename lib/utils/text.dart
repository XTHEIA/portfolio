import 'package:flutter/widgets.dart';

const pretendard = 'Pretendard';
const jetbrainsMono = 'JetBrains Mono';

const bold = TextStyle(
  fontWeight: FontWeight.bold,
);

Text title(
  String data, {
  double? size,
  FontWeight? weight,
  String? font,
  Color? color,
  double? letterSpacing,
}) {
  return Text(
    data,
    style: TextStyle(
      letterSpacing: letterSpacing,
      fontSize: size ?? 20,
      fontFamily: font,
      fontWeight: weight ?? FontWeight.bold,
      color: color,
    ),
  );
}

Text text(
  String data, {
  double? size,
  bool bold = false,
  FontWeight? weight,
  String? font,
  Color? color,
  double? letterSpacing,
}) {
  return Text(
    data,
    style: TextStyle(
      letterSpacing: letterSpacing,
      fontSize: size,
      fontFamily: font,
      fontWeight: bold ? FontWeight.bold : weight,
      color: color,
    ),
  );
}
