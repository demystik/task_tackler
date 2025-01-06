import 'package:intl/intl.dart';

DateTime currentDate = DateTime.now();
String dayName = DateFormat('EEEE').format(currentDate);
String dayNumber = DateFormat('d').format(currentDate);
String monthName = DateFormat('MMMM').format(currentDate);