import 'i_value_object.dart';
import 'specifications/confirm_password_specifications.dart';

class ConfirmPassword implements IValueObject {
  String? password;
  String? confirmPassword;

  ConfirmPassword([this.password = '', this.confirmPassword = '']);

  @override
  bool get isValid =>
      ConfirmPasswordSpecifications.isSatisfiedBy(password, confirmPassword);

  @override
  String? hasError(String errorMessage) => isValid ? null : errorMessage;
}
