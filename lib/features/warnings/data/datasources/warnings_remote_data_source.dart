import 'package:health_dynamics/features/warnings/data/models/alert_model.dart';

abstract class WarningsRemoteDataSource {
  Future<List<AlertModel>> getWarnings();
}
