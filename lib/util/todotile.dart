// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;
  ToDoTile(
    {
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletefunction
    }
    );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:25,left: 25,right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefunction,
              icon:Icons.delete,
              backgroundColor: Colors.red,
              borderRadius:BorderRadius.circular(12),
              )
          ],
          ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.green ,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.black,
              ),
              Text(taskName,
              style:TextStyle(
                decoration: taskCompleted?TextDecoration.lineThrough:TextDecoration.none,
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}