import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_dynamics/core/usecase/no_params.dart';
import 'package:health_dynamics/features/dynamics/domain/usecases/get_dynamics_usecase.dart';
import 'package:health_dynamics/features/dynamics/presentation/bloc/events/dynamics_event_class.dart';
import 'package:health_dynamics/features/dynamics/presentation/bloc/states/dynamics_state_class.dart';

class DynamicsBloc extends Bloc<DynamicsEvent, DynamicsState> {
  final GetDynamicsUseCase _getDynamicsUseCase;

  DynamicsBloc(this._getDynamicsUseCase)
      : super(const DynamicsState.initial()) {
    on<DynamicsEvent>((event, emit) async {
      await event.map(
        started: (_) async => await _onStarted(emit),
        refreshRequested: (_) async => await _onRefreshRequested(emit),
      );
    });
  }

  Future<void> _onStarted(Emitter<DynamicsState> emit) async {
    try {
      if (kDebugMode) {
        print('Starting data fetch...');
      }
      emit(const DynamicsState.loading());

      final result = await _getDynamicsUseCase(const NoParams());

      if (kDebugMode) {
        print('Data fetch result: $result');
      }

      result.fold(
        (failure) {
          if (kDebugMode) {
            print('Failure occurred: ${failure.message}');
          }
          emit(DynamicsState.error(failure.message));
        },
        (dynamics) {
          if (kDebugMode) {
            print('Success! Data length: ${dynamics.length}');
          }
          emit(DynamicsState.loaded(dynamics));
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error in bloc: $e');
      }
      emit(const DynamicsState.error('An unexpected error occurred'));
    }
  }

  Future<void> _onRefreshRequested(Emitter<DynamicsState> emit) async {
    await _onStarted(emit);
  }
}
