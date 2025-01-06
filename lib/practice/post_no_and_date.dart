import 'package:flutter/material.dart';
import 'package:task_tackler/practice/constants.dart';

class PostNoAndDate extends StatelessWidget {
  final String postNumber;
  final String monthName;
  final String dayName;
  final String dayNumber;

  const PostNoAndDate(
      {required this.postNumber,
      required this.monthName,
      required this.dayName,
      required this.dayNumber,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              postNumber,
              style: KTaskNumberTextStyle,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$monthName $dayNumber',
                  style: KDateTextStyle,
                ),
                Text(dayName, style: KDayTextStyle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
