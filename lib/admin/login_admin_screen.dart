import 'package:flutter/material.dart';

import 'home_screen_admin.dart';

class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({super.key});

  @override
  State<LoginAdminScreen> createState() => _LoginAdminScreenState();
}

class _LoginAdminScreenState extends State<LoginAdminScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Admin Dashboard', style: TextStyle(color: Colors.black)),
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
                    const Text('Welcome',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: size.width / 20,
                    ),
                    Image.asset(
                      'assets/images/Roshita.png',  width: 150,
                    ),
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
                    SizedBox(height: size.width / 10),
                    InkWell(
                      onTap: () {
                        {
                          if (formKey.currentState!.validate()) {
                            print('${emailController.text}');
                            print('${passwordController.text}');
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenAdmin(),));
                            
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
