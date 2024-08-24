import 'package:flutter/material.dart';

import 'profile_doctor_screen.dart';

class EditDoctorProfile extends StatefulWidget {
  const EditDoctorProfile({super.key});

  @override
  State<EditDoctorProfile> createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  final forkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ProfileDoctorScreen()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: forkey,
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 50.5,
                      ),
                      const CircleAvatar(
                        radius: 51,
                        backgroundImage: AssetImage('assets/images/pro.JPG'),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: IconButton(
                          icon: const Icon(Icons.edit,
                              color: Color.fromARGB(255, 104, 177, 237),
                              size: 19),
                          onPressed: () {},
                        ),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    if (forkey.currentState!.validate()) {
                      forkey.currentState!.save();
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: size.width / 11,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
