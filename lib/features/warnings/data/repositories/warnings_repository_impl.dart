import 'package:dartz/dartz.dart';
import 'package:health_dynamics/core/error/failure.dart';
import 'package:health_dynamics/core/error/failure/server_failure.dart';
import 'package:health_dynamics/features/warnings/data/datasources/warnings_remote_data_source.dart';
import 'package:health_dynamics/features/warnings/domain/entities/alert_entity.dart';
import 'package:health_dynamics/features/warnings/domain/repositories/warnings_repository.dart';

class WarningsRepositoryImpl implements WarningsRepository {
  final WarningsRemoteDataSource _remoteDataSource;

  const WarningsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<AlertEntity>>> getWarnings() async {
    try {
      final result = await _remoteDataSource.getWarnings();
      // Преобразуем List<AlertModel> в List<AlertEntity>
      final entities = result.map((model) => model.toDomain()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
