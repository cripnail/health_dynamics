import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_dynamics/features/warnings/domain/entities/alert_entity.dart';

part 'warnings_state_class.freezed.dart';

@freezed
class WarningsState with _$WarningsState {
  const factory WarningsState.initial() = Initial;

  const factory WarningsState.loading() = Loading;

  const factory WarningsState.loaded(List<AlertEntity> alerts) = Loaded;

  const factory WarningsState.error(String message) = Error;
}
