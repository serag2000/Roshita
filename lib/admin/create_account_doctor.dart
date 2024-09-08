import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/admin/doctors_page.dart';
import 'package:project/api/create_doctor.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/doctor/profile_doctor_screen.dart';
import 'package:project/models/admin_model/doctor_control.dart';

class CreateAccountDocotor extends StatefulWidget {
  CreateAccountDocotor({super.key}){
    canEdit = false;
  }
  int ?id ;
 late bool canEdit;
  CreateAccountDocotor.edit({required DoctorControl data}) {
    name.text = data.name;
    email.text = data.email;
    phone.text = data.phoneNumber;
    specializatoin.text = data.specilization;
    gender.text = data.gender;
    id = data.id;
    canEdit = true;
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController specializatoin = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  State<CreateAccountDocotor> createState() => _CreateAccountDocotorState();
}

class _CreateAccountDocotorState extends State<CreateAccountDocotor> {
  bool isLoading = false;

  clearData() {
    widget.name.clear();
    widget.email.clear();
    widget.phone.clear();
    widget.specializatoin.clear();
    widget.gender.clear();
    widget.password.clear();
  }

  CreateDoctorApi _api = CreateDoctorApi();

  create({required BuildContext context}) async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _api.addToDoctor(
          email: widget.email.text,
          gender: widget.gender.text,
          name: widget.name.text,
          password: widget.password.text,
          phone: widget.phone.text,
          specilization: widget.specializatoin.text,
          url: 'api/adminAuth/doctorControl');
      var result = jsonDecode(response.body);
      mySnackBarBack(context, result['message']);
      if (response.statusCode == 200) {
        clearData();
      }
    } catch (e) {
      mySnackBarBack(context, e.toString());
      if (kDebugMode) {
        print("eror: " + e.toString());
      }
    }
    setState(() {
      isLoading = false;
    });
  }
  Future<void> editDoctor({required BuildContext context,}) async {
   try{
   
     setState(() {
           isLoading =true;             
                    });  
     var response = await _api.putDoctor(url: 'api/adminAuth/doctorControl/${widget.id}',
         email: widget.email.text,
          gender: widget.gender.text,
          name: widget.name.text,
          password: widget.password.text,
          phone: widget.phone.text,
          specilization: widget.specializatoin.text,
          
     
     );
     if (kDebugMode) {
       print(response.body);
     }
     var result = jsonDecode(response.body);
     if(response.statusCode == 200){
  mySnackBarBack(context, 'done');
      widget.canEdit = false;
      clearData();
     }
    
    }catch(e){
      mySnackBarBack(context, e.toString());
    }
    setState(() {
           isLoading =false;             
                    });  
  
      // ignore: use_build_context_synchronously
      // mySnackBarBack(context, result["error"]);

      // await prefs.setBool('islogin', false);
    }  


    Future <void> removeDoctor({ required BuildContext context})async{
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _api.removeDoctor(
        url: 'api/adminAuth/doctorControl/${widget.id}',
      );
      if (kDebugMode) {
        print(response.body);
      }
      var result = jsonDecode(response.body);
      mySnackBarBack(context, 'done');
      widget.canEdit = false;
      clearData();
    } catch (e) {
      mySnackBarBack(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
    }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('create account for doctor',
            style: TextStyle(color: Colors.black)),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorsPage(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: widget.name,
                decoration: InputDecoration(
                    hintText: 'Name ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: widget.email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: widget.password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: ' Password',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: widget.specializatoin,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Specilization',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: widget.gender,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Gender',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: widget.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Phone Number',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20))),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    widget.canEdit?  editDoctor(context: context) :
                     
                      create(context: context);
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          width: double.infinity,
                          height: size.width / 11,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.blue, width: 1),
                          ),
                          child:  Center(
                            child: Text(
                               widget.canEdit ? 'Edit': "Save",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
                         Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    removeDoctor(context: context);
                  },
                  child: Visibility(
                    visible: canEdit && isLoading == false,
                    child: Container(
                            width: double.infinity,
                            height: size.width / 11,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blue, width: 1),
                            ),
                            child: Center(
                              child: Text(
                                'Delete' ,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
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
