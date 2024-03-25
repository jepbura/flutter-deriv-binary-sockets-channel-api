enum SocketStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == SocketStatus.loading;

  bool get isSuccess => this == SocketStatus.success;

  bool get isFailure => this == SocketStatus.failure;
}

Map<String, String> msgType = {
  "active_symbols": "active_symbols",
  "tick": "tick",
  "ping": "ping",
  "forget": "forget"
};
