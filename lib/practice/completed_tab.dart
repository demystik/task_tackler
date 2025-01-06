import 'package:flutter/material.dart';
import 'package:task_tackler/practice/date.dart';
import 'package:task_tackler/practice/post_no_and_date.dart';


class CompletedTab extends StatelessWidget {
  final String postNumber;


  const CompletedTab({super.key, required this.postNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          PostNoAndDate(postNumber: '0',
           monthName: monthName, 
           dayName: dayName, 
           dayNumber: dayNumber)
        ],
      ),
      
      );
  }
}