import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:health_dynamics/features/dynamics/data/datasources/dynamics_remote_data_source.dart';
import 'package:health_dynamics/features/dynamics/data/models/dynamics_response_model.dart';

class DynamicsRemoteDataSourceImpl implements DynamicsRemoteDataSource {
  final Dio _dio;
  final bool useTestData = true;

  DynamicsRemoteDataSourceImpl(this._dio) {
    _dio.options = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );
  }

  @override
  Future<DynamicsResponseModel> getDynamics() async {
    if (useTestData) {
      if (kDebugMode) {
        print('Using test data');
      }
      return _getTestData();
    }

    try {
      if (kDebugMode) {
        print('Making request to health_mock');
      }
      final response = await _dio
          .get<Map<String, dynamic>>('http://158.160.30.46:8080/health_mock');
      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
        print('Response data: ${response.data}');
      }

      Map<String, dynamic> jsonData = response.data as Map<String, dynamic>;
      return DynamicsResponseModel.fromJson(jsonData);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      return _getTestData();
    }
  }

  DynamicsResponseModel _getTestData() {
    final testData = {
      "alerts": [
        {
          "message":
              "Biomarkers were submitted a long time ago and indicate illness.",
          "resubmitLink": true
        }
      ],
      "dynamics": [
        {"date": "2022-03-05", "lab": "Лаборатория другая", "value": 3.0},
        {"date": "2024-09-12", "lab": "Инвитро", "value": 2.8},
        {"date": "2024-11-15", "lab": "Инвитро", "value": 2.4},
        {"date": "2025-02-09", "lab": "Инвитро", "value": 3.0}
      ]
    };

    return DynamicsResponseModel.fromJson(testData);
  }
}
