import 'dart:math' show min, max;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
        : (dynamics.map((e) => e.value).reduce(min) - 0.5)
            .clamp(0.0, double.infinity);

    final maxY =
        dynamics.isEmpty ? 5.0 : dynamics.map((e) => e.value).reduce(max) + 0.5;

    return AspectRatio(
      aspectRatio: AppTheme.chartAspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: AppTheme.defaultPadding,
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
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= sortedDynamics.length ||
                          value.toInt() < 0) {
                        return const SizedBox();
                      }
                      final date = sortedDynamics[value.toInt()].date;
                      return Transform.translate(
                        offset: const Offset(0, 10),
                        child: Text(
                          DateFormatter.formatChartDate(date),
                          style: AppTheme.subtitleStyle.copyWith(fontSize: 12),
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
                  curveSmoothness: AppTheme.chartCurveSmoothness,
                  color: AppTheme.positiveColor,
                  barWidth: AppTheme.chartLineWidth,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      final value = sortedDynamics[index].value;
                      return FlDotCirclePainter(
                        radius: AppTheme.chartDotRadius,
                        color: value >= AppTheme.valueThreshold
                            ? AppTheme.positiveColor
                            : AppTheme.warningColor,
                        strokeWidth: AppTheme.chartLineWidth,
                        strokeColor: Colors.white,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
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
                  tooltipPadding: const EdgeInsets.all(8),
                  tooltipRoundedRadius: 8,
                  tooltipBorder: BorderSide(color: Colors.grey[300]!),
                  tooltipMargin: 8,
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
