import 'string_specifications.dart';

class PasswordSpecifications {
  static bool isSatisfiedBy(String? value) {
    return StringSpecifications.isSatisfiedBy(value) && value!.length >= 6;
  }
}
