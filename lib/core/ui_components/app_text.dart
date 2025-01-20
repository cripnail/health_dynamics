import 'package:flutter/material.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const AppText.header(
    this.text, {
    super.key,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: AppSizes.headerFontSize,
          fontWeight: FontWeight.bold,
        );

  const AppText.subheader(
    this.text, {
    super.key,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: AppSizes.subheaderFontSize,
          color: Colors.grey,
        );

  const AppText.body(
    this.text, {
    super.key,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: AppSizes.bodyFontSize,
          color: Colors.black54,
        );

  AppText.value(
    this.text, {
    super.key,
    this.textAlign,
    required Color color,
  }) : style = TextStyle(
          fontSize: AppSizes.valueFontSize,
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
