import 'package:flutter/material.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';
import 'package:health_dynamics/core/ui_components/app_spacing.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? borderRadius;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSizes.defaultSpacing),
    this.backgroundColor,
    this.borderRadius = AppSizes.cardBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.cardElevation,
      color: backgroundColor ?? Colors.grey[50],
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(borderRadius ?? AppSizes.cardBorderRadius),
      ),
      child: Padding(
        padding: padding ?? AppSpacing.all,
        child: child,
      ),
    );
  }
}
