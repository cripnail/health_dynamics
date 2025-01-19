import 'package:dartz/dartz.dart';
import 'package:health_dynamics/core/error/failure.dart';
import 'package:health_dynamics/core/usecase/no_params.dart';
import 'package:health_dynamics/core/usecase/usecase.dart';
import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';
import 'package:health_dynamics/features/dynamics/domain/repositories/dynamics_repository.dart';

class GetDynamics implements UseCase<List<DynamicsEntity>, NoParams> {
  final DynamicsRepository _repository;

  const GetDynamics(this._repository);

  @override
  Future<Either<Failure, List<DynamicsEntity>>> call(NoParams params) {
    return _repository.getDynamics();
  }
}
