// import 'package:flutter/material.dart';

// class PracticeDart extends StatelessWidget {
//   const PracticeDart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Hello ListView'),
//           ),
//           body: Container(
//             color: Colors.lightBlue,
//             child: ListView.builder(
//                 reverse: false,
//                 scrollDirection: Axis.vertical,
//                 itemCount: posts.length,
//                 itemBuilder: (context, index) {
//                   return IconList(
//                     leadingIcon: posts[index][1],
//                     iconName: posts[index][0],
//                   );
//                 }),
//           ),
//         ),
//       ),
//     );
//   }
// }

// List posts = [
//   ['This is add icon', Icons.add],
//   ['This is minus icon', Icons.remove],
//   ['This is share icon', Icons.share],
//   ['This is menu icon', Icons.menu],
//   ['This is book icon', Icons.book],
//   ['This is bus alert  icon', Icons.bus_alert],
//   ['This is house icon', Icons.house],
// ];

// class IconList extends StatelessWidget {
//   final IconData leadingIcon;
//   final String iconName;
//   const IconList(
//       {super.key, required this.leadingIcon, required this.iconName});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         child: ListTile(
//           leading: Icon(leadingIcon),
//           title: Text(iconName),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PracticeDart extends StatefulWidget {
  const PracticeDart({super.key});

  @override
  State<PracticeDart> createState() => _PracticeDartState();
}

class _PracticeDartState extends State<PracticeDart> {
  final _controller = TextEditingController();

  void onSaved() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        PostList.posts.add([_controller.text, false]);
      }
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void showBottomShit(context) {
    showModalBottomSheet(
      context: context,
      builder: buildBottomSheet,
    );
  }

  void toggleCheckBox(bool? value, int index) {
    setState(() {
      PostList.posts[index][1] = !PostList.posts[index][1];
    });
  }

  Widget buildBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            const Text(
              'Add task',
              style: TextStyle(fontSize: 30),
            ),
            TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              color: Colors.yellow,
              onPressed: onSaved,
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showBottomShit(context),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('ListView Test'),
          backgroundColor: Colors.red,
          leading: const Icon(Icons.menu),
          actions: const [
            Icon(Icons.smart_button),
          ],
        ),
        body: ListView.builder(
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
            );
          },
        ),
      ),
    );
  }
}

class PostList {
  static List posts = [
    ['In the name of Allah the most beneficient', false],
    ['I love Flutter development.', false],
    ['So bro! dart makes my heart fluter.', false],
    ['All adorations belong to Allah', false],
  ];
}

// Task List Tiles
class ListStyle extends StatelessWidget {
  final String data;
  final bool isTaskCompleted;
  final Function(bool?) toggleCheckBox;
  const ListStyle(
      {super.key,
      required this.data,
      required this.isTaskCompleted,
      required this.toggleCheckBox});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isTaskCompleted,
        onChanged: toggleCheckBox,
      ),
      title: Text(
        data,
        style: TextStyle(
          decoration: isTaskCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
    );
  }
}
