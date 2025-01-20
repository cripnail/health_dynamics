import 'package:flutter/material.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';
import 'package:health_dynamics/core/ui_components/app_spacing.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;

  const AppButton.text({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: AppSpacing.none,
        minimumSize: AppSizes.buttonMinSize,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: AppSizes.buttonFontSize,
          fontWeight: AppSizes.fontWeightMedium,
        ),
      ),
    );
  }
}
