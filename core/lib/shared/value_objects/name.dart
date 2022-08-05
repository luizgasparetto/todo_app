import 'i_value_object.dart';
import 'specifications/name_specifications.dart';

class Name implements IValueObject {
  String? value;

  Name([this.value = '']);

  @override
  bool get isValid => NameSpecifications.isSatisfiedBy(value);

  @override
  String? hasError(String errorMessage) => isValid ? null : errorMessage;
}
