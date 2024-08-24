import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/customer/create_account.dart';
import 'package:project/customer/home_screen.dart';
import 'package:project/tabs_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_http.dart';
import 'forgetpassword/forget_password.dart';

bool islogin = false;

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    super.initState();
    check();
  }

  Future<void> check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool islogin = prefs.getBool('islogin') ?? false;
    if (islogin) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TabsScreen(),
          ));
    }
  }

  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}

Future mySnackBarBack(BuildContext context, String message) async {
  Flushbar(
    message: message,
    // icon: Icon(
    //   isSuccess ?Icons.check_sharp:Icons.warning_amber_rounded,
    //   size: 28.0,
    //   color: mainColor,
    // ),
    margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 70),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.BOTTOM,
    textDirection: Directionality.of(context),
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 2),
    // leftBarIndicatorColor: currentTheme.colorScheme.primary,
  ).show(context);
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // final _api = Api();

  // postHttp(String userName, String password) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // isLoading = true;
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
      
  //     var response = await _api
  //         .post('api/userLogin', {'email': userName, 'password': password});
  //     var result = json.decode(response.body);
  //     if (response.statusCode == 200) {
  //       if (kDebugMode) {
  //         print("access_token ===> ${result['access_token']}");
  //       }

  //       await prefs.setBool('islogin', true);
  //       await prefs.setString('token', result['access_token']);
  //       // ignore: use_build_context_synchronously
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const TabsScreen(),
  //           ));

  //       // final data = result.map((json) => CoinsModel.fromJson(json)).toList();
  //       // setCoins(data);
  //     } else {
  //       if (kDebugMode) {
  //         print("response.statusCode ===> ${response.statusCode}");
  //       }
  //       if (kDebugMode) {
  //         print("response ===> ${response.body}");
  //       }
  //       // ignore: use_build_context_synchronously
  //       mySnackBarBack(context, result["error"]);
  //        setState(() {
  //        isLoading = false;
  //     });
     
  //     await prefs.setBool('islogin', false);
  //     }
  //   } catch (e) {
  //     setState(() {
  //        isLoading = false;
  //     });
     
  //     await prefs.setBool('islogin', false);
     
  //   }
  // }

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
                    const Text('Hello',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: size.width / 20,
                    ),
                     const Text('Log in to your Account'),
                    SizedBox(
                      height: size.width / 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
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
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: const Icon(Icons.remove_red_eye_sharp),
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ForgetPassword()));
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
                    isLoading
                        ? Container(
                            width: 350,
                            height: size.width / 9,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blue, width: 2),
                            ),
                            child: const Center(
                                child: CircularProgressIndicator(color: Colors.white,)),
                          )
                        : InkWell(
                            onTap: () async {
                              {

                                // if (formKey.currentState!.validate()) {
                                  

                                //    try {
                                //     await postHttp(emailController.text,
                                //         passwordController.text);
                                //     //ignore: use_build_context_synchronously;
                                //   } catch (e) {
                                //     isLoading = false;
                                //     if (kDebugMode) {
                                //       print("error");
                                //     }
                                //   }

                                //   islogin = true;
                                //   SharedPreferences prefs =
                                //       await SharedPreferences.getInstance();
                                //   await prefs.setBool('islogin', true);
                                // }
                              }
                            },
                            child: Container(
                              width: 350,
                              height: size.width / 9,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.blue, width: 2),
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const CreateAccount(),
                                  ));
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
