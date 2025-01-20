import 'package:flutter/material.dart';
import 'package:health_dynamics/core/di/injection_container.dart';
import 'package:health_dynamics/core/ui_components/app_icons.dart';
import 'package:health_dynamics/core/ui_components/app_sizes.dart';
import 'package:health_dynamics/core/ui_components/app_spacing.dart';
import 'package:health_dynamics/core/ui_components/app_strings.dart';
import 'package:health_dynamics/core/ui_components/app_text.dart';
import 'package:health_dynamics/core/usecase/no_params.dart';
import 'package:health_dynamics/features/dynamics/domain/usecases/get_dynamics_usecase.dart';
import 'package:health_dynamics/features/dynamics/presentation/widgets/dynamics_chart.dart';
import 'package:health_dynamics/features/dynamics/presentation/widgets/dynamics_list.dart';
import 'package:health_dynamics/features/warnings/presentation/widgets/old_markers_warning.dart';

class DynamicsScreen extends StatefulWidget {
  const DynamicsScreen({super.key});

  @override
  State<DynamicsScreen> createState() => _DynamicsScreenState();
}

class _DynamicsScreenState extends State<DynamicsScreen> {
  final _getWarningsUseCase = sl<GetDynamicsUseCase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(AppIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.header(AppStrings.dynamicsTitle),
            AppText.subheader(AppStrings.dynamicsSubtitle),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _getWarningsUseCase(const NoParams()),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return snapshot.data!.fold(
            (failure) => Center(
              child: AppText.body(failure.message),
            ),
            (dynamics) => RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: AppSpacing.all,
                      child: DynamicsChart(dynamics: dynamics),
                    ),
                  ),
                  if (dynamics.any((d) => d.date.isBefore(DateTime.now()
                      .subtract(const Duration(
                          days: AppSizes.oldMarkersDayThreshold)))))
                    SliverToBoxAdapter(
                      child: OldMarkersWarning(
                        onResubmit: () {
                          // TODO: Implement resubmit action
                        },
                      ),
                    ),
                  DynamicsList(dynamics: dynamics),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
