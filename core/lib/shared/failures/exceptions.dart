import 'i_app_exception.dart';

class DomainException extends IAppException {
  DomainException({required super.message, required super.stackTrace});
}

class DatasourceException extends IAppException {
  DatasourceException({required super.message, required super.stackTrace});
}

class MapperException extends IAppException {
  MapperException({required super.message, required super.stackTrace});
}

class ClientException extends IAppException {
  ClientException({required super.message, required super.stackTrace});
}

class ConnectionException extends IAppException {
  ConnectionException({required super.message, required super.stackTrace});
}

class LocalStorageException extends IAppException {
  LocalStorageException({required super.message, required super.stackTrace});
}
