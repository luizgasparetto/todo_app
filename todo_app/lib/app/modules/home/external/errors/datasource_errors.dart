import 'package:core/core.dart';

class TaskMapperException extends MapperException {
  TaskMapperException({required super.message, required super.stackTrace});
}

class CreateTaskMapperException extends MapperException {
  CreateTaskMapperException({required super.message, required super.stackTrace});
}

class EditTaskMapperException extends MapperException {
  EditTaskMapperException({required super.message, required super.stackTrace});
}
