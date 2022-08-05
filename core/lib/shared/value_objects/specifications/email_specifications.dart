import '../../helpers/custom_regex_expressions.dart';
import 'string_specifications.dart';

class EmailSpecifications {
  static bool isSatisfiedBy(String? value) {
    final validEmailRegex = RegExp(CustomRegexExpressions.validEmail);

    return StringSpecifications.isSatisfiedBy(value) && validEmailRegex.hasMatch(value!);
  }
}
