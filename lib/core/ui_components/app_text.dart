import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const AppText.header(
    this.text, {
    super.key,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );

  const AppText.subheader(
    this.text, {
    super.key,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        );

  const AppText.body(
    this.text, {
    super.key,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        );

  AppText.value(
    this.text, {
    super.key,
    this.textAlign,
    required Color color,
  }) : style = TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
