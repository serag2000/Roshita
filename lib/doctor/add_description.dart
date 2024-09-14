import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:project/api/medicine.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/doctor/profile_doctor_screen.dart';
import 'package:project/models/medicine.dart';
import 'package:project/models/mid_list.dart';

class AddDescription extends StatefulWidget {
  TextEditingController email = TextEditingController();
  AddDescription({super.key, required String userEmail}) {
    email.text = userEmail;
    if (kDebugMode) {
      print(userEmail);
    }
  }

  @override
  State<AddDescription> createState() => _AddDescriptionState();
}

class _AddDescriptionState extends State<AddDescription> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController specializatoin = TextEditingController();
  TextEditingController des = TextEditingController();
  List<MisdList> meds = [
    MisdList(times: TextEditingController(), title: TextEditingController())
  ];
  bool isLoading = false;

  late String token;

  final _api = ShowMedApi();
  List<Medicine> data = [];

  Future<void> show({required BuildContext context}) async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await _api.showMed('api/doctorAuth/medicine');
      var result = jsonDecode(response.body)['data'];
      if (response.statusCode == 200) {
        data = result.map<Medicine>((item) => Medicine.fromJson(item)).toList();
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
    setState(() {
      isLoading = false;
    });
  }

  void showBottomSheet({required BuildContext context, required int medIndex}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // Display a loading indicator if data is still loading
        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Check if categories list is not empty
        if (data.isEmpty) {
          return const Center(child: Text('No Products available.'));
        }

        // Display the list of categories
        return ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Update selected category ID and text field
                setState(() {
                  meds[medIndex].title.text = data[index].title;
                });
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
                child: Text(
                  data[index].title,
                  style: const TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(height: 1),
        );
      },
    );
  }

  bool checkData({required BuildContext context}) {
    if (meds[0].title.text.isEmpty ||
        meds[0].times.text.isEmpty ||
        name.text.isEmpty) {
      mySnackBarBack(context, 'Please Input Data for roshita');
      return false;
    } else {
      return true;
    }
  }

  create({required BuildContext context}) async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _api.addToRoshta(
          decription: des.text,
          patientBirthday: age.text,
          specialization: 'dintist',
          userEmail: widget.email.text,
          meds: meds,
          name: name.text,
          url: 'api/doctorAuth/doctorActions');
      var result = jsonDecode(response.body);
      mySnackBarBack(context, result['message']);
      if (response.statusCode == 200) {}
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add Roshita', style: TextStyle(color: Colors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileDoctorScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    label: const Text('Patient Name'),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              TextFormField(
                controller: age,
                decoration: InputDecoration(
                    label: const Text('Patient Birthday'),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              TextFormField(
                readOnly: true,
                controller: widget.email,
                decoration: InputDecoration(
                    label: const Text('Customer Email'),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              TextFormField(
                controller: specializatoin,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: ('Medicine'),
                ),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: meds.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      SizedBox(
                        width: size.width / 2.3,
                        child: TextFormField(
                          controller: meds[index].title,
                          readOnly: true,
                          onTap: () async {
                            await show(context: context);
                            showBottomSheet(context: context, medIndex: index);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: ('Medicine'),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width / 30),
                      SizedBox(
                        width: size.width / 2.2,
                        child: TextFormField(
                          controller: meds[index].times,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: ('Time'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              SizedBox(
                height: size.width / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          if (meds.length < 5) {
                            meds.add(MisdList(
                                times: TextEditingController(),
                                title: TextEditingController()));
                          }
                        });
                      },
                      child: const Icon(Icons.add)),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          if (meds.length > 1) {
                            meds.removeAt(meds.length - 1);
                          }
                        });
                      },
                      child: const Icon(Icons.remove)),
                ],
              ),
              SizedBox(
                height: size.width / 35,
              ),
              TextFormField(
                maxLines: 3,
                controller: des,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: ('Description'),
                ),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Column(
                        children: [
                          const Text('Are you sure about this data ?'),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (checkData(context: context)) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Column(
                                            children: [
                                              const Text('are u sure ?',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                              TextButton(
                                                  onPressed: () {
                                                    create(context: context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('OK'))
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Yes',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel',
                                        style: TextStyle(
                                          color: Colors.blue,
                                        )),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: size.width / 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width / 30,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          )),
                      SizedBox(
                        width: size.width / 30,
                      ),
                      const Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
