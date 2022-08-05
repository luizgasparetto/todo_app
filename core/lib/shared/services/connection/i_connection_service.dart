abstract class IConnectionService {
  Future<void> getConnectionStatus();
  bool get isOnline;
}

enum ConnectionStatus { offline, online }
