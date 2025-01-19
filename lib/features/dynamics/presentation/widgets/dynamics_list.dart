import 'package:flutter/material.dart';
import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';
import 'package:health_dynamics/features/dynamics/presentation/widgets/dynamics_list_item.dart';

class DynamicsList extends StatelessWidget {
  final List<DynamicsEntity> dynamics;

  const DynamicsList({
    super.key,
    required this.dynamics,
  });

  @override
  Widget build(BuildContext context) {
    final sortedDynamics = List<DynamicsEntity>.from(dynamics)
      ..sort((a, b) => b.date.compareTo(a.date));

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return DynamicsListItem(
            dynamics: sortedDynamics[index],
          );
        },
        childCount: sortedDynamics.length,
      ),
    );
  }
}
