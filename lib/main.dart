import 'package:flutter/material.dart';
import 'package:project/customer/loading.dart';
import 'package:project/doctor/user_not_regester.dart';

import 'pharmacist/home_pharmacist.dart';
import 'pharmacist/roshita_details.dart';








void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: UserNotRegester(),
    );
  }
}
// خلي الhome تخش على Loading