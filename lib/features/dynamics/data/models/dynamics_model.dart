import 'package:health_dynamics/features/dynamics/domain/entities/dynamics_entity.dart';

class DynamicsModel {
  final String date;
  final String laboratory;
  final double value;

  DynamicsModel({
    required this.date,
    required this.laboratory,
    required this.value,
  });

  factory DynamicsModel.fromJson(Map<String, dynamic> json) {
    return DynamicsModel(
      date: json['date'] as String,
      laboratory: json['lab'] as String,
      value: (json['value'] as num).toDouble(),
    );
  }

  DynamicsEntity toDomain() => DynamicsEntity(
        date: DateTime.parse(date),
        laboratory: laboratory,
        value: value,
      );
}
