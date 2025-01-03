import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {

  final String taskName;
  final bool isTaskCompleted;
  final Function(bool?) whenChanged;

  const TodoTile({super.key, 
  required this.taskName, 
  required this.isTaskCompleted, 
  required this.whenChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Container(
      padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Checkbox
            Checkbox(
              value: isTaskCompleted,
              onChanged: whenChanged,
            ),


          

            //Task name
            Text(taskName,
            style: TextStyle(
              fontSize: 16, 
              color: Colors.white,
              decoration: isTaskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            ), ),
          ],
        ) ,
      ),
      );
  }
}