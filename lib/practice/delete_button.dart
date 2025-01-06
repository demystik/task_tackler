 import 'package:flutter/material.dart';


 void deletePressed(int index, BuildContext context, Function deleteConfirmed){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return  AlertDialog(
          backgroundColor: const Color.fromARGB(255, 225, 225, 225),
          title: const Text('Delete this task?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),),
          content: const Text('This task will be removed from the list of your tasks'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancle')
              ),
            OutlinedButton(
              onPressed: () => deleteConfirmed(index),
              child: const Text('Delete')
              ),
          ],
        );
      },
      );
  }