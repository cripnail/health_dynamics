import 'package:equatable/equatable.dart';

class AlertEntity extends Equatable {
  final String message;
  final bool hasResubmitLink;

  const AlertEntity({
    required this.message,
    required this.hasResubmitLink,
  });

  @override
  List<Object?> get props => [message, hasResubmitLink];
}
