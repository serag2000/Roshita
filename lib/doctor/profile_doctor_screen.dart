import 'package:flutter/material.dart';
import 'package:project/doctor/add_description.dart';

import 'edit_doctor_profile.dart';

class ProfileDoctorScreen extends StatefulWidget {
  const ProfileDoctorScreen({super.key});

  @override
  State<ProfileDoctorScreen> createState() => _ProfileDoctorScreenState();
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  final forkey = GlobalKey<FormState>();
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
                  const Text('Serag Sh',
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
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const EditDoctorProfile()));
                    },
                    child: Container(
                      width: 85,
                      height: size.width / 11,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: const Center(
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                            const Text(
                              "Add Description",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
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
