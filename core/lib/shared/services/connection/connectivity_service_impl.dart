import 'dart:async';

import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

import '../../failures/exceptions.dart';
import 'i_connection_service.dart';

class ConnectivityServiceImpl extends ChangeNotifier implements IConnectionService {
  final Connectivity _connectivity;

  late final StreamSubscription? subscription;
  late ConnectionStatus _status;

  ConnectivityServiceImpl(this._connectivity) {
    subscription = _connectivity.onConnectivityChanged.listen((_) => getConnectionStatus());
  }

  @override
  Future<void> getConnectionStatus() async {
    try {
      final result = await _connectivity.checkConnectivity();

      final isMobile = result == ConnectivityResult.mobile;
      final isWifi = result == ConnectivityResult.wifi;
      final isEthernet = result == ConnectivityResult.ethernet;

      if (isMobile || isWifi || isEthernet) {
        _status = ConnectionStatus.online;
      } else {
        _status = ConnectionStatus.offline;
      }

      notifyListeners();
    } catch (error, stackTrace) {
      throw ConnectionException(message: 'Connection Error', stackTrace: stackTrace);
    }
  }

  @override
  bool get isOnline => _status == ConnectionStatus.online;
}
