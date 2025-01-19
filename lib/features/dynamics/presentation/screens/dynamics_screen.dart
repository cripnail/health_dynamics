import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_dynamics/core/di/injection_container.dart';
import 'package:health_dynamics/features/dynamics/presentation/bloc/dynamics_bloc.dart';
import 'package:health_dynamics/features/dynamics/presentation/bloc/dynamics_event.dart';
import 'package:health_dynamics/features/dynamics/presentation/bloc/dynamics_state.dart';
import 'package:health_dynamics/features/dynamics/presentation/widgets/dynamics_chart.dart';
import 'package:health_dynamics/features/dynamics/presentation/widgets/dynamics_list.dart';
import 'package:health_dynamics/features/dynamics/presentation/widgets/old_markers_warning.dart';

class DynamicsScreen extends StatefulWidget {
  const DynamicsScreen({super.key});

  @override
  State<DynamicsScreen> createState() => _DynamicsScreenState();
}

class _DynamicsScreenState extends State<DynamicsScreen> {
  late final DynamicsBloc _dynamicsBloc;

  @override
  void initState() {
    super.initState();
    _dynamicsBloc = sl<DynamicsBloc>();
    _dynamicsBloc.add(const DynamicsEvent.started());
  }

  @override
  void dispose() {
    _dynamicsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dynamics',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'All Period',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<DynamicsBloc, DynamicsState>(
        bloc: _dynamicsBloc,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              _dynamicsBloc.add(const DynamicsEvent.refreshRequested());
            },
            child: state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (dynamics) => CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DynamicsChart(dynamics: dynamics),
                    ),
                  ),
                  if (dynamics.any((d) => d.date.isBefore(
                      DateTime.now().subtract(const Duration(days: 180)))))
                    SliverToBoxAdapter(
                      child: OldMarkersWarning(
                        onResubmit: () {
                          // TODO: имплементировать  ресабмит
                        },
                      ),
                    ),
                  DynamicsList(dynamics: dynamics),
                ],
              ),
              error: (message) => Center(child: Text(message)),
            ),
          );
        },
      ),
    );
  }
}
