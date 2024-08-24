import 'package:flutter/material.dart';

import 'home_pharmacist.dart';

class LoginPharmacist extends StatefulWidget {
  const LoginPharmacist({super.key});

  @override
  State<LoginPharmacist> createState() => _LoginPharmacistState();
}

class _LoginPharmacistState extends State<LoginPharmacist> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Log In', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Hello, Pharmacist!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: size.width / 20,
                    ),
                    const Text('Log In your Account'),
                    SizedBox(
                      height: size.width / 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Inter Your Email or Phone Number',
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          final regexp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!regexp.hasMatch(data)) {
                            return ' Inter your Securty';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: size.width / 90),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Inter Your Password',
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) =>
                              //             const ForgetPasswordDoctor()));
                            },
                            child: const Text('Forget Password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.width / 5),
                    InkWell(
                      onTap: () {
                        {
                          if (formKey.currentState!.validate()) {
                            print('${emailController.text}');
                            print('${passwordController.text}');
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>HomePharmacist(),));
                          }
                        }
                      },
                      child: Container(
                        width: 350,
                        height: size.width / 9,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont Have An Account?  ',
                        ),
                        InkWell(
                            onTap: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (_) => const CreateAccountDoctor(),
                              //     ));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
