import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:health_dynamics/features/dynamics/data/datasources/dynamics_remote_data_source.dart';
import 'package:health_dynamics/features/dynamics/data/datasources/dynamics_remote_data_source_impl.dart';
import 'package:health_dynamics/features/dynamics/data/repositories/dynamics_repository_impl.dart';
import 'package:health_dynamics/features/dynamics/domain/repositories/dynamics_repository.dart';
import 'package:health_dynamics/features/dynamics/domain/usecases/get_dynamics_usecase.dart';
import 'package:health_dynamics/features/dynamics/presentation/bloc/dynamics_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => DynamicsBloc(sl<GetDynamicsUseCase>()));

  sl.registerLazySingleton(() => GetDynamicsUseCase(sl<DynamicsRepository>()));

  sl.registerLazySingleton<DynamicsRepository>(
    () => DynamicsRepositoryImpl(sl<DynamicsRemoteDataSource>()),
  );

  sl.registerLazySingleton<DynamicsRemoteDataSource>(
    () => DynamicsRemoteDataSourceImpl(sl<Dio>()),
  );

  sl.registerLazySingleton(() => Dio());
}
