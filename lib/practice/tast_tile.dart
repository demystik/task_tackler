import 'package:flutter/material.dart';
import 'package:task_tackler/practice/constants.dart';


// Task List Tiles
class ListStyle extends StatelessWidget {
  final String data;
  final bool isTaskCompleted;
  final Function(bool?) toggleCheckBox;
  final Function() deletePressed;
  const ListStyle(
      {super.key,
      required this.data,
      required this.isTaskCompleted,
      required this.toggleCheckBox,
      required this.deletePressed,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 10),
      child: ListTile(
        shape: const StadiumBorder(),
        // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        tileColor: const Color.fromARGB(150, 34, 33, 33),
        textColor:  const Color.fromARGB(197, 255, 255, 255),
        iconColor:  const Color.fromARGB(197, 255, 255, 255),
        leading: Transform.scale(
          scale: 0.8,
          child: Checkbox(
            // visualDensity: VisualDensity(horizontal: 5.0, vertical: 5.0),
            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3)) ),
            side: const BorderSide(width: 1, color:Color.fromARGB(255, 225, 225, 225)),
            checkColor: Colors.white,
            // focusColor: Colors.yellow,
            activeColor: Colors.black,
            // hoverColor: Colors.red,
            value: isTaskCompleted,
            onChanged: toggleCheckBox,
          ),
        ),
        title: Text(
          data,
          style: isTaskCompleted? KCheckedTaskTextStyle : KTaskTextStyle,
        ),
        trailing:  GestureDetector(
          onTap: deletePressed,
          child:const  Icon(Icons.delete_rounded,size: 20, grade: 6,),
        ),
      ),
    );
  }
}