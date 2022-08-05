import 'package:flutter/foundation.dart';

class ErrorStackTrace {
  static void printError({required String message, required StackTrace stackTrace}) {
    debugPrintStack(stackTrace: stackTrace, label: 'Error: $message');
  }
}
