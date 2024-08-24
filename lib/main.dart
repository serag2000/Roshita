import 'package:flutter/material.dart';
import 'package:project/admin/home_screen_admin.dart';
import 'package:project/customer/home_screen.dart';





//import 'package:project/customer/login_screen.dart';




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
      home: const HomeScreenAdmin()
    );
  }
}
// خلي الhome تخش على auth