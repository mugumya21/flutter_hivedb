import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  String taskName;
  Function(bool?)? onChanged;
  bool iscompleted;
  Function(BuildContext)? deleteFunction;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.iscompleted,
      required this.deleteFunction,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Checkbox(value: iscompleted, onChanged: onChanged),
              Text(taskName,
                  style: TextStyle(
                      decoration: iscompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.yellow),
        height: 50,
        width: 50,
      ),
    );
  }
}
