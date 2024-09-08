import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:project/api/medicine.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/doctor/profile_doctor_screen.dart';
import 'package:project/models/medicine.dart';

class AddDescription extends StatefulWidget {
  const AddDescription({super.key});

  @override
  State<AddDescription> createState() => _AddDescriptionState();
}

class _AddDescriptionState extends State<AddDescription> {
  int count = 1;
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController specializatoin= TextEditingController();
  TextEditingController item = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController des = TextEditingController();
  bool isLoading = false;

late String token;

final _api = ShowMedApi();
List<Medicine> data = [];

Future<List<Medicine>> show() async {
  // isLoading = true;
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

  return data;
}
  Future <void> getMid()async{

  }

  void checkData(){
    if(name.text.isEmpty || age.text.isEmpty|| email.text.isEmpty|| time.text.isEmpty){
      mySnackBarBack(context, 'Please input the Paitient Data');
    }else{
      //راهي مزال ما كملت 

  }

  }
  

  // List<String> itemList = [" Item 1", "Item 2", "Item 3 "];
  // String selectMedicine = "Item 1 ";
  final List<String> items = [
    'Item1 ',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add Roshita', style: TextStyle(color: Colors.black)),
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileDoctorScreen()));
        },icon: Icon(Icons.arrow_back , color: Colors.black,)),
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
                controller: email,
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
                controller:specializatoin,
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
                  itemCount: count,
                  itemBuilder: (context, index) => Row(
                    children: [
                      SizedBox(
                        width: size.width / 2.3,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(8)),
                          // child: DropdownButton(
                          //   value: 'item1 ',
                          //   hint: const Text('selectMedicine'),
                          //   items: itemList
                          //       .map((e) => DropdownMenuItem(
                          //             child: Text(e),
                          //             value: e,
                          //           ))
                          //       .toList(),
                          //   onChanged: (val) {
                          //     setState(() {
                          //       selectMedicine= val!;
                          //     });
                          //   },
                          // ),

                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items
                                .map((String item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 55,
                              width: 140,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width / 30),
                      SizedBox(
                        width: size.width / 2.2,
                        child: TextFormField(
                          controller: time,
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
                          if (count < 5) {
                            count++;
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
                          if (count > 1) {
                            count--;
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
                                    checkData();
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Column(
                                          children: [
                                            const Text(
                                                'The user is not registered in app',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('OK'))
                                          ],
                                        ),
                                      ),
                                    );
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


