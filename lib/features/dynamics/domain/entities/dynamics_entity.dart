import 'package:equatable/equatable.dart';

class DynamicsEntity extends Equatable {
  final DateTime date;
  final String laboratory;
  final double value;

  const DynamicsEntity({
    required this.date,
    required this.laboratory,
    required this.value,
  });

  @override
  List<Object?> get props => [date, laboratory, value];
}
