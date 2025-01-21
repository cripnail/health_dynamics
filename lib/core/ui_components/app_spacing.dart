import 'package:flutter/material.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';

class AppSpacing {
  const AppSpacing._();

  static const none = EdgeInsets.zero;
  static const all = EdgeInsets.all(AppSizes.defaultSpacing);
  static const horizontal =
      EdgeInsets.symmetric(horizontal: AppSizes.defaultSpacing);
  static const vertical =
      EdgeInsets.symmetric(vertical: AppSizes.defaultSpacing);

  static const warningPadding = EdgeInsets.fromLTRB(AppSizes.defaultSpacing,
      0.0, AppSizes.defaultSpacing, AppSizes.defaultSpacing);
  static const headerFontSize = 24.0;
  static const subheaderFontSize = 16.0;
  static const bodyFontSize = 14.0;
  static const valueFontSize = 18.0;
}
