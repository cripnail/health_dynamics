import 'dart:math';

import 'package:health_dynamics/core/ui_components/app_sizes.dart';

class AppUtils {
  const AppUtils._();

  static String formatDecimal(double value) {
    return value.toStringAsFixed(1);
  }

  static bool isOldMarker(DateTime date) {
    return date.isBefore(
      DateTime.now().subtract(const Duration(days: 180)),
    );
  }

  static double calculateMinY(List<double> values) {
    if (values.isEmpty) return 0.0;
    return (values.reduce(min) - AppSizes.chartValuePadding)
        .clamp(0.0, double.infinity);
  }

  static double calculateMaxY(List<double> values) {
    if (values.isEmpty) return AppSizes.chartDefaultMaxValue;
    return values.reduce(max) + AppSizes.chartValuePadding;
  }

  static bool isValidChartIndex(int index, int length) {
    return index >= 0 && index < length;
  }
}
