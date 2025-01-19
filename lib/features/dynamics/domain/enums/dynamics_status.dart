enum DynamicsStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == DynamicsStatus.initial;

  bool get isLoading => this == DynamicsStatus.loading;

  bool get isSuccess => this == DynamicsStatus.success;

  bool get isFailure => this == DynamicsStatus.failure;
}
