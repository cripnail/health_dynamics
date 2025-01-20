import 'package:flutter/foundation.dart';

import 'package:health_dynamics/features/dynamics/data/models/dynamics_model.dart';
import 'package:health_dynamics/features/warnings/data/models/alert_model.dart';

class DynamicsResponseModel {
  final List<DynamicsModel> items;
  final List<AlertModel> alerts;

  DynamicsResponseModel({
    required this.items,
    required this.alerts,
  });

  factory DynamicsResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      if (kDebugMode) {
        print('Parsing DynamicsResponseModel from: $json');
      }

      final dynamicsList = json['dynamics'] as List? ?? [];
      final items = dynamicsList.map((item) {
        if (kDebugMode) {
          print('Parsing dynamics item: $item');
        }
        return DynamicsModel.fromJson(item as Map<String, dynamic>);
      }).toList();

      final alertsList = (json['alerts'] as List?)?.map((item) {
            if (kDebugMode) {
              print('Parsing alert item: $item');
            }
            return AlertModel.fromJson(item as Map<String, dynamic>);
          }).toList() ??
          [];

      if (kDebugMode) {
        print(
            'Successfully parsed ${items.length} items and ${alertsList.length} alerts');
      }

      return DynamicsResponseModel(
        items: items,
        alerts: alertsList,
      );
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error parsing DynamicsResponseModel: $e');
      }
      if (kDebugMode) {
        print('Stack trace: $stackTrace');
      }
      rethrow;
    }
  }
}
