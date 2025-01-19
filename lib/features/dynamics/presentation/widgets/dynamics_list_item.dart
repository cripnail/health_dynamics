import 'package:flutter/material.dart';

import 'package:health_dynamics/core/ui_components/app_text.dart';
import 'package:health_dynamics/core/ui_components/app_theme.dart';
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
          padding: AppTheme.listItemPadding,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: AppText.value(
                  DateFormatter.formatMonthDay(dynamics.date),
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: AppText.subheader(
                  dynamics.laboratory,
                ),
              ),
              Expanded(
                child: AppText.value(
                  dynamics.value.toStringAsFixed(1),
                  textAlign: TextAlign.right,
                  color: dynamics.value >= AppTheme.valueThreshold
                      ? AppTheme.positiveColor
                      : AppTheme.warningColor,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: AppTheme.dividerColor,
        ),
      ],
    );
  }
}
