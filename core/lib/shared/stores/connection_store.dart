import 'package:dependency_module/dependency_module.dart';
import '../failures/i_app_exception.dart';
import '../services/connection/connectivity_service_impl.dart';
import 'states/connection_state.dart';

class ConnectionStore extends StreamStore<IAppException, ConnectionState> {
  final ConnectivityServiceImpl _connectionService;

  ConnectionStore(this._connectionService) : super(const ConnectionState(hasConnection: false));

  @override
  Future<void> initStore() async {
    _connectionService.addListener(() {
      _connectionService.isOnline ? update(state.toOnline()) : update(state.toOffline());
    });
  }
}
