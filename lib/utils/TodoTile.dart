import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final bool TaskCompleted;
  final String TaskName;
  Function(bool?)? onChanged;
  Function(BuildContext)? editfunction;
  Function(BuildContext)? deletefunction;

  Todotile(
      {super.key,
      required this.TaskCompleted,
      required this.TaskName,
      required this.onChanged,
      required this.editfunction,
      required this.deletefunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 14.0, right: 14.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10.0),
              onPressed: editfunction,
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              icon: Icons.edit, // Icon for the action
              label: 'Edit', // Optional label
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10.0),
              onPressed: deletefunction, backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete, // Icon for the action
              label: 'Delete',
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Checkbox(value: TaskCompleted, onChanged: onChanged),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(TaskName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
