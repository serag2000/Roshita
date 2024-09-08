// import 'package:flutter/material.dart';
// import 'package:project/admin/create_account_pharmcist.dart';
// import 'package:project/admin/home_screen_admin.dart';

// class testscreen extends StatefulWidget {
//   const testscreen({super.key});

//   @override
//   State<testscreen> createState() => _testscreenState();
// }

// class _testscreenState extends State<testscreen> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             Card(
//               child: ListTile(
//                 leading:
//                     const Icon(Icons.add_circle_outline, color: Colors.blue),
//                 title: const Text('Add Pharmacist'),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const CreateAccountPharmcist(),
//                       ));
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: const Color.fromARGB(255, 228, 231, 232),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 10, 46, 75),
//         title: const Text('Pharmacist', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 // showSearch(context: context, delegate: DataSearch());
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const HomeScreenAdmin(),
//                     ));
//               },
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               ))
//         ],
//         elevation: 0,
//       ),
//       body: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Center(
//               child: Container(
//                 width: double.infinity
//                 ,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.green),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/images/gust.png',
//                             width: size.width / 6,
//                             height: size.width / 5,
//                           ),
//                           const Column(
//                             children: [
//                               Text(
//                                 '30%',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               Text(
//                                 'Special Offer',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             width: 80,
//                           ),
//                           const Column(
//                             children: [
//                               Text(
//                                         'Special Offer',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                       SizedBox(
//                             height: 15,
//                           ),
//                                                               Text(
//                                     'Special Offer',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
