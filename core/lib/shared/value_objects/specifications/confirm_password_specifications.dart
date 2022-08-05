import 'password_specifications.dart';

class ConfirmPasswordSpecifications {
  static bool isSatisfiedBy(String? password, String? confirmPassword) {
    return confirmPassword == password && PasswordSpecifications.isSatisfiedBy(password);
  }
}
