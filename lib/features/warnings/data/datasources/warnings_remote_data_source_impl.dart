import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:health_dynamics/core/error/exceptions/server_exception.dart';
import 'package:health_dynamics/features/warnings/data/datasources/warnings_remote_data_source.dart';
import 'package:health_dynamics/features/warnings/data/models/alert_model.dart';

class WarningsRemoteDataSourceImpl implements WarningsRemoteDataSource {
  final Dio _dio;

  WarningsRemoteDataSourceImpl(this._dio);

  @override
  Future<List<AlertModel>> getWarnings() async {
    if (kDebugMode) {
      print('Fetching warnings...');
    }
    try {
      final response = await _dio.get<Map<String, dynamic>>('/warnings');
      if (response.data == null) {
        return [];
      }

      final alerts = (response.data?['alerts'] as List<dynamic>?) ?? [];
      return alerts
          .map((alert) => AlertModel.fromJson(alert as Map<String, dynamic>))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching warnings: $e');
      }
      throw ServerException(e.toString());
    }
  }
}
