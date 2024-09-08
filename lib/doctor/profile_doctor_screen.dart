import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/doctor_profile.dart';
import 'package:project/doctor/add_description.dart';
import 'package:project/models/admin_model/doctor_control.dart';


class ProfileDoctorScreen extends StatefulWidget {
  const ProfileDoctorScreen({super.key});

  @override
  State<ProfileDoctorScreen> createState() => _ProfileDoctorScreenState();
}
late String token;

final _api = ShowDoctorProfile();
//List<DoctorControl> data = [];
  //final _api = ShowDoctorProfile();
  DoctorControl data = DoctorControl (id: 0, name: 'unkown', email: 'ff',phoneNumber: '5',gender: '5',specilization: '') ;
  bool isLoading = false;
  bool canEdit = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController specilization = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
Future<void> show({required BuildContext context}) async {
  // isLoading = true;
  try {
     var response = await _api.getdoctorProfile('api/doctorAuth/DoctorProfile');
    var result = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      data = DoctorControl.fromJson(json);
      name.text = data.name;
      email.text = data.email;
      gender.text= data.gender;
      phoneNumber.text= data.phoneNumber;
      specilization.text= data.specilization;
      if (kDebugMode) {
        print("token:" + token.toString());
        // print("dddd ${jsonDecode(response.body)['data']}");
        // print("res: $result");
        // print("resultssss ===> ${data}");
      }

      // await prefs.setBool('islogin', true);
      // await prefs.setString('token', result['access_token']);
      // // ignore: use_build_context_synchronously

      // setCoins(data);
    } else {
      if (kDebugMode) {
        print("response.statusCode ===> ${response.statusCode}");
        print("data ====> $data");
      }
      if (kDebugMode) {
        print("response ===> ${response.body}");
      }
      // ignore: use_build_context_synchronously
      // mySnackBarBack(context, result["error"]);

      // await prefs.setBool('islogin', false);
    }
  } catch (e) {
    // await prefs.setBool('islogin', false)
  }

  
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  final forkey = GlobalKey<FormState>();
  
   @override
  void initState() {
    show(context: context);
    super.initState();
  }
bool canRead= true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
      ),
      body: Form(
        key: forkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 52,
                      ),
                      CircleAvatar(
                        radius: 51,
                        backgroundImage: AssetImage('assets/images/pro.JPG'),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14,
                        child: Icon(Icons.edit, size: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width / 25,
                  ),
                   Text(name.text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: size.width / 25,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                       readOnly:canRead ,
                      controller: name,
                      decoration: const InputDecoration(
                        labelText: ('UserName'),
                      ),
                      validator: (value) {
                        if (value!.length >= 2) {
                          return null;
                        } else {
                          return 'Enter Your Name';
                        }
                      },
                    ),
                    TextFormField(
                       readOnly:canRead ,
                      controller: gender,
                      decoration: const InputDecoration(
                        labelText: ('Gender'),
                      ),
                      validator: (value) {
                        if (value!.length >= 4) {
                          return null;
                        } else {
                          return 'Enter Your Gender';
                        }
                      },
                    ),
                    TextFormField(
                      readOnly:canRead ,
                      controller: phoneNumber,
                        decoration: const InputDecoration(
                          labelText: ('Phone Number'),
                        ),
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'inter your number';
                          }
                          final regexp = RegExp(
                              r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
                          if (!regexp.hasMatch(data)) {
                            return ' Inter your Securty';
                          }
                          return null;
                        }),
                    TextFormField(
                       readOnly:canRead ,
                      controller: email,
                        decoration: const InputDecoration(
                          labelText: ('Email'),
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
                        }),
                    TextFormField(
                       readOnly:canRead ,
                      controller: specilization,
                      decoration: const InputDecoration(
                        labelText: ('specializatoin'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (_) => const EditDoctorProfile()));
                  //   },
                  //   child: Container(
                  //     width: 85,
                  //     height: size.width / 11,
                  //     decoration: BoxDecoration(
                  //       color: Colors.blue,
                  //       borderRadius: BorderRadius.circular(5),
                  //       border: Border.all(color: Colors.blue, width: 2),
                  //     ),
                  //     child: const Center(
                  //       child: Text(
                  //         "Edit",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: 250,
                    height: size.width / 11,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => AddDescription(),));
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width / 30,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 15,
                                )),
                            SizedBox(
                              width: size.width / 30,
                            ),
                            Center(
                              child: const Text(
                                "Add Description",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
