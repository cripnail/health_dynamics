import 'package:health_dynamics/features/dynamics/data/models/dynamics_response_model.dart';

abstract class DynamicsRemoteDataSource {
  Future<DynamicsResponseModel> getDynamics();
}
