import 'i_value_object.dart';
import 'specifications/task_specifications.dart';

class Task implements IValueObject {
  String? value;

  Task([this.value = '']);

  @override
  bool get isValid => TaskSpecifications.isSatisfiedBy(value);
@override
  String? hasError(String errorMessage) => isValid ? null : errorMessage;
}
