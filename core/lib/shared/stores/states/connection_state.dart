
class ConnectionState {
  final bool hasConnection;

  const ConnectionState({
    required this.hasConnection,
  });

  ConnectionState toOnline() => copyWith(hasConnection: true);
  ConnectionState toOffline() => copyWith(hasConnection: false);

  ConnectionState copyWith({bool? hasConnection}) {
    return ConnectionState(
      hasConnection: hasConnection ?? this.hasConnection,
    );
  }
}
