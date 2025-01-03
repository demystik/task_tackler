// import 'package:flutter/material.dart';

// class Practice2 extends StatelessWidget {
//   const Practice2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: 
//     Scaffold(
//       appBar: AppBar(
//         title: const Text('ListView!!!!!!!!!!!'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: details.length,
//           itemBuilder: (context, index){
//             return IdentityBox(
//             icon: details[index][0],
//             name: details[index][1], 
//             age: details[index][2], 
//             gender: details[index][3], 
//             grade: details[index][4]);
//           },
//           ),
//       ),
//     ),
//     );
//   }
//   }

//   List details = [
//     [Icons.person, 'Thaoban', 27, 'Male', 95.3, ],
//     [Icons.person_2_outlined, 'Adelola', 27, 'Male', 95.3, ],
//     [Icons.person_3_rounded, 'Adeyemi', 27, 'Male', 95.3, ],
//     [Icons.person_4_outlined, 'Musa', 27, 'Male', 95.3, ],
//     [Icons.person_2_sharp, 'Ramadan', 27, 'Male', 95.3, ],
//   ];

//   class IdentityBox extends StatelessWidget {
//     final IconData icon;
//     final String name;
//     final int age;
//     final String gender;
//     final double grade;

//   const IdentityBox({super.key,
//   required this.icon, 
//   required this.name,
//    required this.age, 
//    required this.gender, 
//    required this.grade});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         // height: 100,
//         padding: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//         color: Colors.grey,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           children: [
//             Icon(icon, size: 250, ),
//             Text('Name: $name', style: kTestStyle,),
//             Text('Age: $age', style: kTestStyle,),
//             Text('gender: $gender',  style: kTestStyle,),
//             Text('Grade: $grade',  style: kTestStyle,),
//           ],
//         ),
//       ),
//     );
//   }
// }
// const kTestStyle = TextStyle(
//   fontSize: 30,
//   fontWeight: FontWeight.w400,
//   color: Colors.white,
// );
