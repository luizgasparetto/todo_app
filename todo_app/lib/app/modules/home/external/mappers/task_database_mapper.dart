class TaskDatabaseMapper {
  static Map<String, dynamic> toMap({List? create, List? edit, List? delete}) {
    return {
      'create': create ?? [],
      'edit': edit ?? [],
      'delete': delete ?? [],
    };
  }
}
