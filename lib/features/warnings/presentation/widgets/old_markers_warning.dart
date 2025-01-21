import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:health_dynamics/core/di/injection_container.dart';
import 'package:health_dynamics/core/ui_components/app_button.dart';
import 'package:health_dynamics/core/ui_components/app_card.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';
import 'package:health_dynamics/core/ui_components/app_spacing.dart';
import 'package:health_dynamics/core/ui_components/app_text.dart';
import 'package:health_dynamics/core/usecase/no_params.dart';
import 'package:health_dynamics/features/warnings/domain/usecases/get_warnings_usecase.dart';

class OldMarkersWarning extends StatefulWidget {
  final VoidCallback onResubmit;

  const OldMarkersWarning({
    super.key,
    required this.onResubmit,
  });

  @override
  State<OldMarkersWarning> createState() => _OldMarkersWarningState();
}

class _OldMarkersWarningState extends State<OldMarkersWarning> {
  final _getWarningsUseCase = sl<GetWarningsUseCase>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return FutureBuilder(
      future: _getWarningsUseCase(const NoParams()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }

        return snapshot.data!.fold(
          (failure) => const SizedBox(),
          (alerts) {
            if (alerts.isEmpty) {
              return const SizedBox();
            }

            final alert = alerts.first;
            return Padding(
              padding: AppSpacing.warningPadding,
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.body(alert.message),
                    if (alert.hasResubmitLink) ...[
                      AppSizes.itemSpacing,
                      AppButton.text(
                        text: l10n.resubmitButtonText,
                        onPressed: widget.onResubmit,
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
