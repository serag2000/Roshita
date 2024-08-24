import 'dart:async';

import 'package:flutter/material.dart';

import 'helper/const.dart';
import 'into_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const IntroScreen()));
    });

   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:mainColor,
      body: Center(
        child: SizedBox(
          height: size.width / 4,
          child: Image.asset(
            "assets/images/splashRoshita.png",
          ),
        ),
      ),
    );
  }
}
