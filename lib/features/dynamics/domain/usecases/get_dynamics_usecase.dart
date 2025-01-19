import 'package:dartz/dartz.dart';
import 'package:health_dynamics/core/error/failure.dart';
import 'package:health_dynamics/core/usecase/no_params.dart';
import 'package:health_dynamics/core/usecase/usecase.dart';
import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';
import 'package:health_dynamics/features/dynamics/domain/repositories/dynamics_repository.dart';

class GetDynamicsUseCase implements UseCase<List<DynamicsEntity>, NoParams> {
  final DynamicsRepository repository;

  const GetDynamicsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DynamicsEntity>>> call(NoParams params) async {
    return await repository.getDynamics();
  }
}
