class ShowLocalNotificationDTO {
  final int id;
  final String title;
  final DateTime endDate;
  final String body;
  final String secondBody;

  const ShowLocalNotificationDTO({
    required this.id,
    required this.title,
    required this.endDate,
    required this.body,
    required this.secondBody,
  });
}
