// import 'package:flutter/material.dart';
// import 'package:project/admin/home_screen_admin.dart';

// class CreateAccountPharmcist extends StatefulWidget {
//   const CreateAccountPharmcist({super.key});

//   @override
//   State<CreateAccountPharmcist> createState() => _CreateAccountPharmcistState();
// }

// class _CreateAccountPharmcistState extends State<CreateAccountPharmcist> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('create account for Pharmacist', style: TextStyle(
//           color: Colors.black
//         )),
//         elevation: 0,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const HomeScreenAdmin(),
//                   ));
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             )),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(

//             children: [
//               TextFormField(
//                   decoration: InputDecoration(
//                     hintText: 'Name ',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0)),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(15)
//                         )
//                   ),
//                   ),

//               const SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                   decoration: InputDecoration(
//                    border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15)
//                    ),
//                     hintText: 'Email',
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(15)
//                     )
//                   ),
//                   ),
//               const SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                   decoration: InputDecoration(
//                    border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15)
//                    ),
//                     hintText: ' Password',
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(15)
//                     )
//                   ),
//                   ),
//              const SizedBox(
//                 height: 15,
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/admin/pharmacist_page.dart';
import 'package:project/api/create_pharmacist.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/doctor/profile_doctor_screen.dart';
import 'package:project/models/admin_model/all_pharmacists.dart';


// ignore: must_be_immutable
class CreateAccountPharmcist extends StatefulWidget {
  CreateAccountPharmcist({super.key}) {
    canEdit = false;
  }
  int? id;
  late bool canEdit;
  CreateAccountPharmcist.edit({required AllPharmacists data}) {
    name.text = data.name;
    email.text = data.email;
    id = data.id;
    canEdit = true;
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  State<CreateAccountPharmcist> createState() =>
      __CreateAccountPharmcistStateState();
}

class __CreateAccountPharmcistStateState extends State<CreateAccountPharmcist> {
  bool isLoading = false;

  clearData() {
    widget.name.clear();
    widget.email.clear();

    widget.password.clear();
  }

  CreatePhatmacistApi _api = CreatePhatmacistApi();


  Future <void> removePharmatistic({ required BuildContext context})async{
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _api.removePharmatistic(
        url: 'api/adminAuth/pharamacistControl/${widget.id}',
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
  create({required BuildContext context}) async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _api.addToPhatmacist(
          email: widget.email.text,
          name: widget.name.text,
          password: widget.password.text,
          url: 'api/adminAuth/pharamacistControl');
      var result = jsonDecode(response.body);
      mySnackBarBack(context, 'Done');
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

  Future<void> editPhatmacist({
    required BuildContext context,
  }) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _api.putPhatmacist(
        url: 'api/adminAuth/pharamacistControl/${widget.id}',
        email: widget.email.text,
        name: widget.name.text,
        password: widget.password.text,
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

    // ignore: use_build_context_synchronously
    // mySnackBarBack(context, result["error"]);

    // await prefs.setBool('islogin', false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('create account for Pharmacist',
            style: TextStyle(color: Colors.black)),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PharmacistPage(),
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    widget.canEdit
                        ? editPhatmacist(context: context)
                        : create(context: context);
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
                          child: Center(
                            child: Text(
                              widget.canEdit ? 'Edit' : "Save",
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
                    removePharmatistic(context: context);
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
