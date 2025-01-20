import 'package:flutter/material.dart';
import 'package:health_dynamics/core/ui_components/app_colors.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';
import 'package:health_dynamics/core/ui_components/app_spacing.dart';
import 'package:health_dynamics/core/ui_components/app_text.dart';
import 'package:health_dynamics/core/ui_components/app_theme.dart';
import 'package:health_dynamics/core/utils/app_utils.dart';
import 'package:health_dynamics/core/utils/date_formatter.dart';
import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';

class DynamicsListItem extends StatelessWidget {
  final DynamicsEntity dynamics;

  const DynamicsListItem({
    super.key,
    required this.dynamics,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppSpacing.all,
          child: Row(
            children: [
              Expanded(
                flex: AppSizes.dateColumnFlex,
                child: AppText.value(
                  DateFormatter.formatMonthDay(dynamics.date),
                  color: AppColors.textPrimary,
                ),
              ),
              Expanded(
                flex: AppSizes.labColumnFlex,
                child: AppText.subheader(
                  dynamics.laboratory,
                ),
              ),
              Expanded(
                child: AppText.value(
                  AppUtils.formatDecimal(dynamics.value),
                  textAlign: TextAlign.right,
                  color: dynamics.value >= AppTheme.valueThreshold
                      ? AppColors.positiveColor
                      : AppColors.warningColor,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: AppSizes.dividerHeight,
          color: AppColors.dividerColor,
        ),
      ],
    );
  }
}
