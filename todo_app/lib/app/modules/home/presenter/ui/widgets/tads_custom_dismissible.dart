import 'package:flutter/material.dart';
import 'package:tads_design_system/tads_design_system.dart';

import '../../../domain/entities/task_entity.dart';

class TADSCustomDismissible extends StatefulWidget {
  const TADSCustomDismissible({
    Key? key,
    required this.task,
    required this.onTap,
    required this.onDeleted,
    required this.onEdit,
  }) : super(key: key);
  final TaskEntity task;
  final void Function() onTap;
  final void Function() onDeleted;
  final void Function() onEdit;

  @override
  State<TADSCustomDismissible> createState() => _TADSCustomDismissibleState();
}

class _TADSCustomDismissibleState extends State<TADSCustomDismissible> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: Key(widget.task.id.toString()),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            return true;
          } else {
            widget.onEdit();
            return false;
          }
        },
        onDismissed: (direction) => widget.onDeleted(),
        background: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.edit),
        ),
        secondaryBackground: const Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete),
        ),
        child: TADSCustomTaskCard(
          taskTitle: widget.task.name,
          taskStatus: widget.task.done,
          taskDeadline: widget.task.deadlineAt,
          onTap: () => widget.onTap(),
        ),
      ),
    );
  }
}
