import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/forget_password.dart';
import 'package:project/customer/login_screen.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  // final TextEditingController codeController= TextEditingController();
  final forkey = GlobalKey<FormState>();
TextEditingController email = TextEditingController();
TextEditingController otp = TextEditingController();
TextEditingController newPassword= TextEditingController();

final forgetPasswordApi api = forgetPasswordApi();

 rest() async {
    try {
      var response =
          await api.resetPass(url:'api/resetPassword', email: email.text, otp: otp.text, newPassword: newPassword.text);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
       
               showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Your password has been reset successfully"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                },
                child: const Text("login"),
              ),
            ],
          );
        },
      );
      }
      else{
        if (kDebugMode) {
          print(result);
        }
      mySnackBarBack(context, "Failed to reset password. Please try again.");

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
                  ' Reset Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                const Text(
                    'Enter the verification code we just sent on your email address'),
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
                TextFormField(
                   controller: otp,
                  decoration: InputDecoration(
                    labelText: 'Otp',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),

                ),
                SizedBox(
                  height: size.width / 20,
                ),
                TextFormField(
                   controller: newPassword,
                   decoration: InputDecoration(
                   labelText: 'New Password',
                   border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
  
                ),
                SizedBox(
                  height: size.width / 10,
                ),
                InkWell(
                  onTap: () {
                         if(email.text.isEmpty || otp.text.isEmpty || newPassword.text.isEmpty)
                         {
                          mySnackBarBack(context,
                            'Please input your data');
                         }
                         else{
                          rest();
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
                        "submit",
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
                      'Did not Recieved Code?  ',
                    ),
                    InkWell(
                        onTap: () {
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()) );
                        },
                        child: const Text(
                          'Resend',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget row(size) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       SizedBox(
  //         width: size.width / 7,
  //         child: TextFormField(
  //             decoration: const InputDecoration(border: OutlineInputBorder())),
  //       ),
  //       //SizedBox(width: size.width/30),
  //       SizedBox(
  //         width: size.width / 7,
  //         child: TextFormField(
  //             decoration: const InputDecoration(border: OutlineInputBorder())),
  //       ),
  //       //SizedBox(width: size.width/80),
  //       SizedBox(
  //         width: size.width / 7,
  //         child: TextFormField(
  //             decoration: const InputDecoration(border: OutlineInputBorder())),
  //       ),
  //       //SizedBox(width: size.width/30),
  //       SizedBox(
  //         width: size.width / 7,
  //         child: TextFormField(
  //             decoration: const InputDecoration(border: OutlineInputBorder())),
  //       ),
  //     ],
  //   );
  // }
}
