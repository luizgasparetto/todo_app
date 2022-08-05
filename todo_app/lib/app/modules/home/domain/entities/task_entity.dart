class TaskEntity {
  const TaskEntity({
    this.id = 0,
    this.name = '',
    this.done = false,
    required this.createAt,
    required this.deadlineAt,
    required this.updateAt,
  });

  final int id;
  final String name;
  final bool done;
  final DateTime createAt;
  final DateTime deadlineAt;
  final DateTime updateAt;

  TaskEntity copyWith({
    int? id,
    String? name,
    bool? done,
    DateTime? createAt,
    DateTime? deadlineAt,
    DateTime? updateAt,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      done: done ?? this.done,
      createAt: createAt ?? this.createAt,
      deadlineAt: deadlineAt ?? this.deadlineAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
