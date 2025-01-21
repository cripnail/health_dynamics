import 'package:dartz/dartz.dart';
import 'package:health_dynamics/core/error/failure.dart';
import 'package:health_dynamics/features/warnings/domain/entities/alert_entity.dart';

abstract class WarningsRepository {
  Future<Either<Failure, List<AlertEntity>>> getWarnings();
}
