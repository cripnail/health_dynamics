import 'package:freezed_annotation/freezed_annotation.dart';

part 'dynamics_event_class.freezed.dart';

@freezed
class DynamicsEvent with _$DynamicsEvent {
  const factory DynamicsEvent.started() = _Started;
  const factory DynamicsEvent.refreshRequested() = _RefreshRequested;
}