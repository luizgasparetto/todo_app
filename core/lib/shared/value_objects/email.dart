import 'i_value_object.dart';
import 'specifications/email_specifications.dart';

class Email implements IValueObject {
  String? value;

  Email([this.value = '']);

  @override
  bool get isValid => EmailSpecifications.isSatisfiedBy(value);

  @override
  String? hasError(String errorMessage) => isValid ? null : errorMessage;
}
