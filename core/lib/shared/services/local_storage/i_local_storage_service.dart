import 'dtos/local_database_delete_dto.dart';
import 'dtos/local_database_get_string_dto.dart';
import 'dtos/local_database_set_string_dto.dart';
import 'dtos/local_database_set_string_list_dto.dart';

abstract class ILocalStorageService {
  Future<String?> getString(LocalDatabaseGetStringDTO params);
  Future<List<String>?> getStringList(LocalDatabaseGetStringDTO params);
  Future<void> setString(LocalDatabaseSetStringDTO params);
  Future<void> setStringList(LocalDatabaseSetStringListDTO params);
  Future<void> delete(LocalDatabaseDeleteDTO params);
}
