import 'package:flutter/material.dart';

import 'package:health_dynamics/core/ui_components/app_colors.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';

class AppTheme {
  const AppTheme._();

  static const valueThreshold = AppSizes.valueThreshold;

  static const positiveColor = AppColors.positiveColor;
  static const warningColor = AppColors.warningColor;
  static const subtitleColor = AppColors.subtitleColor;
  static const dividerColor = AppColors.dividerColor;
  static const chartGradientStartColor = AppColors.chartGradientStartColor;
  static const chartGradientEndColor = AppColors.chartGradientEndColor;

  static const TextStyle titleStyle = TextStyle(
    fontSize: AppSizes.headerFontSize,
    fontWeight: AppSizes.fontWeightBold,
    color: Colors.black,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: AppSizes.subheaderFontSize,
    color: subtitleColor,
  );

  static const double chartAspectRatio = AppSizes.chartAspectRatio;
  static const double chartLineWidth = AppSizes.chartLineWidth;
  static const double chartDotRadius = AppSizes.chartDotRadius;
  static const double chartCurveSmoothness = AppSizes.chartCurveSmoothness;
}
