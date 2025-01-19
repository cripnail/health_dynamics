import 'package:equatable/equatable.dart';

class Dynamics extends Equatable {
  final DateTime date;
  final String laboratory;
  final double value;

  const Dynamics({
    required this.date,
    required this.laboratory,
    required this.value,
  });

  @override
  List<Object> get props => [date, laboratory, value];
}
