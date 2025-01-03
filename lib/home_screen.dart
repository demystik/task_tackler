import 'package:flutter/material.dart';
import 'package:task_tackler/utils/dialoge_box.dart';

import 'package:task_tackler/utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Text controller
  final _controller = TextEditingController();

  final List toDoTasks = [
    ['Code and Code', false],
  ];

  //On tap Checkbox
  void whenBoxChanged(value, index) {
    setState(() {
      toDoTasks[index][1] = !toDoTasks[index][1];
    });
  }

  //Save task button
  void saveNewTask(){
    setState(() {
      if (_controller.text.isNotEmpty){
      toDoTasks.add([_controller.text, false]);
      }
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //Create New Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSaved: saveNewTask,
          onCancelled: () => Navigator.of(context).pop(),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        //AppBar
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: const Text(
            'TASK TACKLER',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          leading: const Icon(Icons.menu, color: Colors.white,),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 13),
              child: Icon(Icons.share, color: Colors.white,),
            )
          ],
        ),

        //Floating Action Button
        floatingActionButton: FloatingActionButton (
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),


        body: ListView.builder(
            itemCount: toDoTasks.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: toDoTasks[index][0],
                isTaskCompleted: toDoTasks[index][1],
                whenChanged: (value) { whenBoxChanged(value, index);},
              );
            }),
      ),
    );
  }
}
