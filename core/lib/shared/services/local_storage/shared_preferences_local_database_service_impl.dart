import 'package:dependency_module/dependency_module.dart';

import '../../failures/exceptions.dart';
import 'dtos/local_database_delete_dto.dart';
import 'dtos/local_database_get_string_dto.dart';
import 'dtos/local_database_set_string_dto.dart';
import 'dtos/local_database_set_string_list_dto.dart';
import 'i_local_storage_service.dart';

class SharedPreferencesLocalStorageServiceImpl implements ILocalStorageService {
  const SharedPreferencesLocalStorageServiceImpl();

  @override
  Future<String?> getString(LocalDatabaseGetStringDTO params) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      return prefs.getString(params.key);
    } catch (e, st) {
      throw LocalStorageException(message: 'SharedPref Service Exception', stackTrace: st);
    }
  }

  @override
  Future<void> setString(LocalDatabaseSetStringDTO params) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      await prefs.setString(params.key, params.value);
    } catch (e, st) {
      throw LocalStorageException(message: 'SharedPref Service Exception', stackTrace: st);
    }
  }

  @override
  Future<List<String>?> getStringList(LocalDatabaseGetStringDTO params) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      return prefs.getStringList(params.key);
    } catch (e, st) {
      throw LocalStorageException(message: 'SharedPref Service Exception', stackTrace: st);
    }
  }

  @override
  Future<void> setStringList(LocalDatabaseSetStringListDTO params) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      await prefs.setStringList(params.key, params.strings);
    } catch (e, st) {
      throw LocalStorageException(message: 'SharedPref Service Exception', stackTrace: st);
    }
  }

  @override
  Future<void> delete(LocalDatabaseDeleteDTO params) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      await prefs.remove(params.key);
    } catch (e, st) {
      throw LocalStorageException(message: 'SharedPref Service Exception', stackTrace: st);
    }
  }
}
