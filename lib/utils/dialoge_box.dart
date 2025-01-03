import 'package:flutter/material.dart';
import 'package:task_tackler/utils/my_button.dart';


class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSaved; 
  final VoidCallback onCancelled;

  const DialogBox ({
  super.key, 
  required this.controller, 
  required this.onSaved, 
  required this.onCancelled,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //Textfield................
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                // The save button...........
                MyButton(
                  text: 'Save', 
                  onPressed: onSaved,
                ),

               const SizedBox(width: 10),

                // The cancel button................
                MyButton(text: 'Cancle', onPressed: onCancelled),
                
              ],
            )
          ],
        ),
      )


    );
  }
}