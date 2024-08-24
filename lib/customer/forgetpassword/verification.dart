import 'package:flutter/material.dart';
import 'package:project/customer/forgetpassword/reset_password.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final forkey = GlobalKey<FormState>();
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
                  'Verification',
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
                row(size),
                SizedBox(
                  height: size.width / 10,
                ),
                InkWell(
                  onTap: () {
                    if (forkey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ResetPassword()));
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
                        "verfiy",
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

  Widget row(size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: size.width / 7,
          child: TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder())),
        ),
        //SizedBox(width: size.width/30),
        SizedBox(
          width: size.width / 7,
          child: TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder())),
        ),
        //SizedBox(width: size.width/80),
        SizedBox(
          width: size.width / 7,
          child: TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder())),
        ),
        //SizedBox(width: size.width/30),
        SizedBox(
          width: size.width / 7,
          child: TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder())),
        ),
      ],
    );
  }
}
