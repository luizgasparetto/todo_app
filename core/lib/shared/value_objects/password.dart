import 'i_value_object.dart';
import 'specifications/password_specifications.dart';

class Password implements IValueObject {
  String? value;

  Password([this.value = '']);

  @override
  bool get isValid => PasswordSpecifications.isSatisfiedBy(value);

  @override
  String? hasError(String errorMessage) => isValid ? null : errorMessage;
}
