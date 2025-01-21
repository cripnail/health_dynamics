import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_dynamics/core/usecase/no_params.dart';
import 'package:health_dynamics/features/warnings/domain/usecases/get_warnings_usecase.dart';
import 'package:health_dynamics/features/warnings/presentation/bloc/warnings_event_class.dart';
import 'package:health_dynamics/features/warnings/presentation/bloc/warnings_state_class.dart';

class WarningsBloc extends Bloc<WarningsEvent, WarningsState> {
  final GetWarningsUseCase _getWarningsUseCase;

  WarningsBloc(this._getWarningsUseCase)
      : super(const WarningsState.initial()) {
    on<WarningsEvent>((event, emit) async {
      await event.map(
        started: (_) async => await _onStarted(emit),
        refreshRequested: (_) async => await _onRefreshRequested(emit),
      );
    });
  }

  Future<void> _onStarted(Emitter<WarningsState> emit) async {
    emit(const WarningsState.loading());
    final result = await _getWarningsUseCase(const NoParams());
    result.fold(
      (failure) => emit(WarningsState.error(failure.message)),
      (alerts) => emit(WarningsState.loaded(alerts)),
    );
  }

  Future<void> _onRefreshRequested(Emitter<WarningsState> emit) async {
    await _onStarted(emit);
  }
}
