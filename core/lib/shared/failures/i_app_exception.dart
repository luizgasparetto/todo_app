import 'error_stacktrace.dart';

abstract class IAppException implements Exception {
  final String message;
  final StackTrace stackTrace;

  IAppException({required this.message, required this.stackTrace}) {
    ErrorStackTrace.printError(message: message, stackTrace: stackTrace);
  }
}
