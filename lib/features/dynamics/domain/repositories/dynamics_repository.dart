import 'package:dartz/dartz.dart';
import 'package:health_dynamics/core/error/failure.dart';
import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';

abstract class DynamicsRepository {
  Future<Either<Failure, List<DynamicsEntity>>> getDynamics();
}
