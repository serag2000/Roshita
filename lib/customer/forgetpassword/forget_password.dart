import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/forget_password.dart';
import 'package:project/doctor/profile_doctor_screen.dart';
import '../login_screen.dart';
import 'verification.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key}) {
    email.text = data.email;
  }

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  TextEditingController email = TextEditingController();
  final forkey = GlobalKey<FormState>();
  final forgetPasswordApi api = forgetPasswordApi();
  add() async {
    try {
      var response =
          await api.forgetPass(url:'api/forgetPassword', email: email.text);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
         int otp = result['otp']; 
               showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("OTP Sent"),
            content: Text("Your OTP is: $otp"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Verification(),));
                },
                child: Text("Next"),
              ),
            ],
          );
        },
      );
      }
      else{
      mySnackBarBack(context, "Failed to send code. Please try again.");

      }
       
    } catch (e) {
      if (kDebugMode) {
        print("eror: " + e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: forkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Forget Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  const Text(
                      'please enter the email address linked with your account'),
                  SizedBox(
                    height: size.height / 9,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                  SizedBox(
                    height: size.width / 10,
                  ),
                  InkWell(
                    onTap: () {
                      // if(forkey.currentState!.validate()){
                      //    Navigator.push(context, MaterialPageRoute(builder: (_) => const Verification()) );
                      // }
                      // if(forkey.currentState!.validate()){
                      // add();
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => const Verification()) );
                      if (email.text.isEmpty) {
                        mySnackBarBack(context,
                            'Please input your email');
                      }
                      else{
                        add();
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: size.width / 9,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: const Center(
                        child: Text(
                          "Send Code",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.width / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already Have An Account?  ',
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()));
                          },
                          child: const Text(
                            'Log in Now',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
