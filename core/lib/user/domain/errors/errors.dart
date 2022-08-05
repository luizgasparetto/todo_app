import 'package:core/core.dart';

class UnauthorizatedException extends DomainException {
  UnauthorizatedException({required super.message, required super.stackTrace});
}
