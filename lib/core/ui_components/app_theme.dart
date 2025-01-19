import 'package:flutter/material.dart';

class AppTheme {
  static const double valueThreshold = 2.8;

  static const Color positiveColor = Color(0xFF4CAF50); // Green
  static const Color warningColor = Color(0xFFFFA726); // Orange
  static const Color subtitleColor = Color(0xFF757575); // Grey
  static const Color dividerColor = Color(0xFFE0E0E0);
  static const Color chartGradientStartColor = Color(0x294CAF50);
  static const Color chartGradientEndColor = Color(0x104CAF50);

  static const EdgeInsets defaultPadding = EdgeInsets.all(16.0);
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16.0,
    color: subtitleColor,
  );

  static const double chartAspectRatio = 1.7;
  static const double chartLineWidth = 2.0;
  static const double chartDotRadius = 4.0;
  static const double chartCurveSmoothness = 0.35;
}
