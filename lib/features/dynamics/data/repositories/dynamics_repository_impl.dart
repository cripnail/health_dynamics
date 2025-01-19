import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:health_dynamics/core/error/exceptions/server_exception.dart';
import 'package:health_dynamics/core/error/failure.dart';
import 'package:health_dynamics/core/error/failure/server_failure.dart';
import 'package:health_dynamics/features/dynamics/data/datasources/dynamics_remote_data_source.dart';
import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';
import 'package:health_dynamics/features/dynamics/domain/repositories/dynamics_repository.dart';

class DynamicsRepositoryImpl implements DynamicsRepository {
  final DynamicsRemoteDataSource _remoteDataSource;

  const DynamicsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<DynamicsEntity>>> getDynamics() async {
    try {
      if (kDebugMode) {
        print('Repository: calling remote data source');
      }
      final response = await _remoteDataSource.getDynamics();

      if (kDebugMode) {
        print('Repository: converting to entities');
      }
      final entities = response.items.map((model) => model.toDomain()).toList();

      if (kDebugMode) {
        print('Repository: success, returning ${entities.length} entities');
      }
      return Right(entities);
    } on ServerException catch (e) {
      if (kDebugMode) {
        print('Repository: server exception - ${e.toString()}');
      }
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      if (kDebugMode) {
        print('Repository: unknown error - ${e.toString()}');
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
