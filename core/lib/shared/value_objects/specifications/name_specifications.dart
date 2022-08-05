import 'string_specifications.dart';

class NameSpecifications {
  static bool isSatisfiedBy(String? value) {
    return StringSpecifications.isSatisfiedBy(value) && value!.length >= 3;
  }
}
