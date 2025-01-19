class AlertModel {
  final String message;
  final bool hasResubmitLink;

  AlertModel({
    required this.message,
    required this.hasResubmitLink,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      message: json['message'] as String,
      hasResubmitLink: json['resubmitLink'] as bool,
    );
  }
}
