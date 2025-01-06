import 'package:flutter/material.dart';


class BuildBottomSheet extends StatelessWidget {

  final TextEditingController controller;
  final VoidCallback onSaved;

  const BuildBottomSheet({super.key, required this.controller, required this.onSaved});


  @override
  Widget build(BuildContext context) {
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
              
              controller: controller,
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
}

