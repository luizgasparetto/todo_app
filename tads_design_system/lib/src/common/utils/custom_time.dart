import 'package:flutter/material.dart';

class CustomTime {
  static String ajustTime(TimeOfDay time) {
    String hour = '${time.hour}';
    String minute = '${time.minute}';

    if (time.hour < 10) {
      hour = '0${time.hour}';
    }

    if (time.minute < 10) {
      minute = '0${time.minute}';
    }

    return '$hour:$minute';
  }

  static String ajustDateTime(DateTime time) {
    String month = '${time.month}';
    String day = '${time.day}';

    if (time.month < 10) {
      month = '0${time.month}';
    }

    if (time.day < 10) {
      day = '0${time.day}';
    }

    return '$day/$month';
  }

  static String fullDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static bool isAfter(DateTime now, DateTime date) {
    final dateNow = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    final dateCompare = DateTime(date.year, date.month, date.day, date.hour, date.minute);

    return dateCompare.isAfter(dateNow);
  }

  static bool isBefore(DateTime now, DateTime date) {
    final dateNow = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    final dateCompare = DateTime(date.year, date.month, date.day, date.hour, date.minute);

    return dateCompare.isBefore(dateNow);
  }
}
