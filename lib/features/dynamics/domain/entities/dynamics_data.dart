import 'package:equatable/equatable.dart';

import 'package:health_dynamics/features/dynamics/domain/entities/dynamics.dart';

class DynamicsData extends Equatable {
  final List<Dynamics> items;
  final bool hasOldMarkers;

  const DynamicsData({
    required this.items,
    required this.hasOldMarkers,
  });

  @override
  List<Object> get props => [items, hasOldMarkers];
}
