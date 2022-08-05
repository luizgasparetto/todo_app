import 'package:core/shared/stores/connection_store.dart';
import 'package:dependency_module/dependency_module.dart';

import 'core.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Clients
        Bind.factory(
          (i) => Dio(
            BaseOptions(
              baseUrl: AppApiConstants.baseUrl,
              responseType: ResponseType.json,
              contentType: 'application/json',
              connectTimeout: 35 * 1000,
              receiveTimeout: 35 * 1000,
              sendTimeout: 35 * 1000,
            ),
          ),
          export: true,
        ),

        Bind.singleton((i) => DioClientServiceImpl(i(), i(), i(), i()), export: true),

        Bind.singleton((i) => AuthInterceptorImpl(i(), i(), i(), i())),

        // Connection
        Bind.factory((i) => Connectivity(), export: true),
        Bind.singleton((i) => ConnectivityServiceImpl(i()), export: true),

        // Overlay
        Bind.singleton((i) => AsukaOverlayServiceImpl(), export: true),

        // Local Storage
        Bind.singleton((i) => const SharedPreferencesLocalStorageServiceImpl(), export: true),

        // Local Notification
        Bind.factory((i) => FlutterLocalNotificationsPlugin(), export: true),
        Bind.singleton((i) => LocalNotificationServiceImpl(i()), export: true),

        Bind.singleton((i) => ConnectionStore(i()), export: true),
        Bind.singleton((i) => AuthStore(i(), i()), export: true),
      ];
}
