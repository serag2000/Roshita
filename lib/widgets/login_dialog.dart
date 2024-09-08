import 'package:flutter/material.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/helper/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loginDialog({ required BuildContext context,required Size size}){

  showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: Column(children: [
                Image.asset('assets/images/error.png', width: 150, height: 150),
                const SizedBox(
                  height: 5,
                ),
                const Text('Warrning !'),
                const SizedBox(
                  height: 10,
                ),
                const Text('You Must be Login ',
                    style: TextStyle(fontSize: 14)),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async{
                    SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('islogin', false);
                  await prefs.clear();
                 Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                  },
                  child: Container(
                    width: size.width / 1.1,
                    height: size.width / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor,
                      border: Border.all(color: mainColor, width: 2),
                    ),
                    child: const Center(
                      child: Text(
                        "Login now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          color: backgroundScreenColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ])));
}