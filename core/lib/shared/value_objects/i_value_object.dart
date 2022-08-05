abstract class IValueObject {
  bool get isValid;

  String? hasError(String errorMessage);
}
