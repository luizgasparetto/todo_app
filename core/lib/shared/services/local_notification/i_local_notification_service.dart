import 'package:core/shared/services/local_notification/dtos/show_local_notification_dto.dart';

abstract class ILocalNotificationService {
  Future<void> showNotification(ShowLocalNotificationDTO params);
  Future<void> deleteNotification(int id);
  Future<void> redirectPayloadForNotifications();
  Future<void> replaceANotification(ShowLocalNotificationDTO params);
  Future<void> cancelAllNotifications();
}
