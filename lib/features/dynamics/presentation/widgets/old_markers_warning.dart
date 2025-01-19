import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:health_dynamics/core/ui_components/app_button.dart';
import 'package:health_dynamics/core/ui_components/app_card.dart';
import 'package:health_dynamics/core/ui_components/app_text.dart';

class OldMarkersWarning extends StatelessWidget {
  final VoidCallback onResubmit;

  const OldMarkersWarning({
    super.key,
    required this.onResubmit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.body(l10n.oldMarkersMessage),
            const SizedBox(height: 8),
            AppButton.text(
              text: l10n.resubmitButtonText,
              onPressed: onResubmit,
            ),
          ],
        ),
      ),
    );
  }
}
