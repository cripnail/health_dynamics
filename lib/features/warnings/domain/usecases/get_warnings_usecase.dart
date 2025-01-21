import 'package:dartz/dartz.dart';
import 'package:health_dynamics/core/error/failure.dart';
import 'package:health_dynamics/core/usecase/no_params.dart';
import 'package:health_dynamics/core/usecase/usecase.dart';
import 'package:health_dynamics/features/warnings/domain/entities/alert_entity.dart';
import 'package:health_dynamics/features/warnings/domain/repositories/warnings_repository.dart';

class GetWarningsUseCase implements UseCase<List<AlertEntity>, NoParams> {
  final WarningsRepository repository;

  const GetWarningsUseCase(this.repository);

  @override
  Future<Either<Failure, List<AlertEntity>>> call(NoParams params) async {
    return await repository.getWarnings();
  }
}
