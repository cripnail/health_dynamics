import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';

part 'dynamics_state_class.freezed.dart';

@freezed
class DynamicsState with _$DynamicsState {
  const factory DynamicsState.initial() = Initial;
  const factory DynamicsState.loading() = Loading;
  const factory DynamicsState.loaded(List<DynamicsEntity> dynamics) = Loaded;
  const factory DynamicsState.error(String message) = Error;
}