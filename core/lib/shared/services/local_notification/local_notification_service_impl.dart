import 'package:core/constants/app_routes.dart';
import 'package:core/shared/services/local_notification/dtos/show_local_notification_dto.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:tads_design_system/tads_design_system.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'i_local_notification_service.dart';

class LocalNotificationServiceImpl implements ILocalNotificationService {
  final FlutterLocalNotificationsPlugin localNotification;

  LocalNotificationServiceImpl(this.localNotification) {
    _setupTimezone();
    _initializeNotifications();
  }

  @override
  Future<void> showNotification(ShowLocalNotificationDTO params) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.max,
    );

    final now = DateTime.now();
    final isAfter = CustomTime.isAfter(now, params.endDate);

    if (isAfter) {
      await localNotification.zonedSchedule(
        params.id,
        params.title,
        params.secondBody,
        await _nextInstanceOfHour(params.endDate),
        const NotificationDetails(android: androidDetails),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );

      final date = params.endDate.subtract(const Duration(minutes: 30));
      final isAfterEnd = CustomTime.isAfter(now, date);

      if (isAfterEnd) {
        await localNotification.zonedSchedule(
          params.id * -1,
          params.title,
          params.body,
          await _nextInstanceOfHour(date),
          const NotificationDetails(android: androidDetails),
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
        );
      }
    }
  }

  Future<tz.TZDateTime> _nextInstanceOfHour(DateTime date) async {
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      date.year,
      date.month,
      date.day,
      date.hour,
      date.minute,
    );
    return scheduledDate;
  }

  @override
  Future<void> redirectPayloadForNotifications() async {
    final details = await localNotification.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {
      Modular.to.pushReplacementNamed(AppRoutes.toSplash);
    }
  }

  Future<void> _setupTimezone() async {
    tz.initializeTimeZones();

    final timeZone = await FlutterNativeTimezone.getLocalTimezone();

    if (timeZone == 'GMT') {
      tz.setLocalLocation(tz.getLocation('Etc/GMT'));
    } else {
      tz.setLocalLocation(tz.getLocation(timeZone));
    }
  }

  Future<void> _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    await localNotification.initialize(
      const InitializationSettings(android: android),
      onSelectNotification: (_) => Modular.to.pushReplacementNamed(Modular.initialRoute),
    );
  }

  @override
  Future<void> deleteNotification(int id) async {
    await localNotification.cancel(id);
    await localNotification.cancel(id * -1);
  }

  @override
  Future<void> replaceANotification(ShowLocalNotificationDTO params) async {
    await deleteNotification(params.id);
    await showNotification(params);
  }

  @override
  Future<void> cancelAllNotifications() async {
    await localNotification.cancelAll();
  }
}
