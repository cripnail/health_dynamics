import 'dart:math' show min, max;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';
import 'package:health_dynamics/core/ui_components/app_spacing.dart';
import 'package:health_dynamics/core/ui_components/app_theme.dart';
import 'package:health_dynamics/core/utils/date_formatter.dart';
import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';

class DynamicsChart extends StatelessWidget {
  final List<DynamicsEntity> dynamics;

  const DynamicsChart({
    super.key,
    required this.dynamics,
  });

  @override
  Widget build(BuildContext context) {
    if (dynamics.isEmpty) {
      return const SizedBox();
    }

    final sortedDynamics = List<DynamicsEntity>.from(dynamics)
      ..sort((a, b) => a.date.compareTo(b.date));

    final minY = dynamics.isEmpty
        ? 0.0
        : (dynamics.map((e) => e.value).reduce(min) -
                AppSizes.chartValuePadding)
            .clamp(0.0, double.infinity);

    final maxY = dynamics.isEmpty
        ? AppSizes.chartDefaultMaxValue
        : dynamics.map((e) => e.value).reduce(max) + AppSizes.chartValuePadding;

    return AspectRatio(
      aspectRatio: AppSizes.chartAspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.chartCornerRadius),
        ),
        child: Padding(
          padding: AppSpacing.all,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: AppSpacing.all.bottom,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= sortedDynamics.length ||
                          value.toInt() < 0) {
                        return const SizedBox();
                      }
                      final date = sortedDynamics[value.toInt()].date;
                      return Transform.translate(
                        offset:
                            const Offset(0, AppSizes.chartBottomTitleOffset),
                        child: Text(
                          DateFormatter.formatChartDate(date),
                          style: AppTheme.subtitleStyle
                              .copyWith(fontSize: AppSizes.chartTitlesFontSize),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: sortedDynamics.length.toDouble() - 1,
              minY: minY,
              maxY: maxY,
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    sortedDynamics.length,
                    (i) => FlSpot(
                      i.toDouble(),
                      sortedDynamics[i].value,
                    ),
                  ),
                  isCurved: true,
                  curveSmoothness: AppSizes.chartCurveSmoothness,
                  color: AppTheme.positiveColor,
                  barWidth: AppSizes.chartLineWidth,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      final value = sortedDynamics[index].value;
                      return FlDotCirclePainter(
                        radius: AppSizes.chartDotRadius,
                        color: value >= AppTheme.valueThreshold
                            ? AppTheme.positiveColor
                            : AppTheme.warningColor,
                        strokeWidth: AppSizes.chartLineWidth,
                        strokeColor: Colors.white,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.chartGradientStartColor,
                        AppTheme.chartGradientEndColor,
                      ],
                    ),
                  ),
                ),
              ],
              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  tooltipPadding: AppSpacing.all,
                  tooltipRoundedRadius: AppSizes.chartCornerRadius,
                  tooltipBorder: BorderSide(color: Colors.grey[300]!),
                  tooltipMargin: AppSizes.smallSpacing,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      final date = sortedDynamics[spot.x.toInt()].date;
                      return LineTooltipItem(
                        '${spot.y.toStringAsFixed(1)}\n${DateFormatter.formatChartDate(date)}',
                        const TextStyle(color: Colors.black),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
