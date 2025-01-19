class ServerException implements Exception {
  final String message;

  const ServerException([this.message = 'Server error']);

  @override
  String toString() => message;
}