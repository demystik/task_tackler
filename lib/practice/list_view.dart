
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_tackler/practice/constants.dart';



class PracticeDart extends StatefulWidget {
  const PracticeDart({super.key});
  @override
  State<PracticeDart> createState() => _PracticeDartState();
}
class _PracticeDartState extends State<PracticeDart> {

  

  final _controller = TextEditingController();
  String postNumber = '';
  

  //Save the new task to the post 
  void onSaved() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        PostList.posts.add([_controller.text, false]);
      }
      _controller.clear();
      // showPostNumber();
    });
    postNumber = (PostList.posts.length).toString();
    Navigator.of(context).pop();
  }

  // String showPostNumber(){
  //   setState(() {
  //     postNumber = postNumber++;
      
  //   });
  // }

  //show bottom shit
  void showBottomShit(context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 225, 225, 225),
      context: context,
      builder: buildBottomSheet,
    );
  }

  //CheckBox Toggled
  void toggleCheckBox(bool? value, int index) {
    setState(() {
      PostList.posts[index][1] = !PostList.posts[index][1];
    });
  }

  //Delete Button Confirmed
  void deleteConfirmed(int index){
    setState(() {
      PostList.posts.removeAt(index);
    });
    postNumber = (PostList.posts.length).toString();
    Navigator.of(context).pop();
  }
 
  //Delete button Pressed
  void deletePressed(int index){
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


  //Bottom sheet layout
  Widget buildBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Container(
        // color: const Color.fromARGB(255, 225, 225, 225),
        child: Column(
          children: [
            const Text(
              'Add task',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15.0,),
            TextField(
              
              controller: _controller,
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Add new task',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1, color: Colors.grey,
                  )
                ),
              ),
            ),
            const SizedBox(height: 15.0,),
            MaterialButton(
              
              color: Colors.black,
              onPressed: onSaved,
              child: const Text('Save', style: TextStyle(color: Colors.white ),),
            )
          ],
        ),
      ),
    );
  }

 @override
  void initState() {
    super.initState();
    postNumber = PostList.posts.length.toString();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 34, 33, 33),
          shape: const CircleBorder(),
          onPressed: () => showBottomShit(context),
          child: const Icon(Icons.add, color: Colors.white, size: 20,),
        ),
        appBar: AppBar(
          title: Center(child: Text('My To-Do List', textAlign: TextAlign.center, style: kAppBarTitleText)),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(postNumber, style: KTaskNumberTextStyle,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$monthName $dayNumber', style: KDateTextStyle,),
                          Text(dayName, style: KDayTextStyle),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  reverse: false,
                  itemCount: PostList.posts.length,
                  itemBuilder: (context, index) {
                    return ListStyle(
                      data: PostList.posts[index][0],
                      isTaskCompleted: PostList.posts[index][1],
                      toggleCheckBox: (value) {
                        toggleCheckBox(value, index);
                      },
                      deletePressed: () { deletePressed(index); }
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PostList {
  static List posts = [
    ['Task-1', false],
    ['Task-2', false],
    ['Task-3', false],
    ['Task-4', false],
  ];


}




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
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        // tileColor: const Color.fromARGB(255, 34, 33, 33),
        textColor:  const Color.fromARGB(197, 255, 255, 255),
        iconColor:  const Color.fromARGB(197, 255, 255, 255),
        leading: Transform.scale(
          scale: 0.7,
          child: Checkbox(
            // visualDensity: VisualDensity(horizontal: 5.0, vertical: 5.0),
            // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3)) ),
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

DateTime currentDate = DateTime.now();
String dayName = DateFormat('EEEE').format(currentDate);
String dayNumber = DateFormat('d').format(currentDate);
String monthName = DateFormat('MMMM').format(currentDate);