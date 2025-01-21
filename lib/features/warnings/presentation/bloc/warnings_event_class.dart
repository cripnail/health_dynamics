import 'package:freezed_annotation/freezed_annotation.dart';

part 'warnings_event_class.freezed.dart';

@freezed
class WarningsEvent with _$WarningsEvent {
  const factory WarningsEvent.started() = _Started;

  const factory WarningsEvent.refreshRequested() = _RefreshRequested;
}
