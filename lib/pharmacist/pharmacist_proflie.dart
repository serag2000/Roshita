import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/pharmacist.dart';
import 'package:project/models/admin_model/all_pharmacists.dart';


class ProfilepharmacistScreen extends StatefulWidget {
  const ProfilepharmacistScreen({super.key});

  @override
  State<ProfilepharmacistScreen> createState() => _ProfilepharmacistScreenState();
}
late String token;

final _api = ShowPharmacistProfile();
//List<DoctorControl> data = [];
  //final _api = ShowDoctorProfile();
  AllPharmacists data = AllPharmacists (id: 0, name: 'unkown', email: 'ff',) ;
  bool isLoading = false;
  bool canEdit = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

Future<void> show({required BuildContext context}) async {
  // isLoading = true;
  try {
     var response = await _api.getPharmacistProfile('api/pharamacistAuth/Pharmacistprofile');
    var result = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      data = AllPharmacists.fromJson(json);
      name.text = data.name;
      email.text = data.email;

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

class _ProfilepharmacistScreenState extends State<ProfilepharmacistScreen> {
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
                        backgroundImage: AssetImage('assets/images/gust.png'),
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
                     
                    ),


                    TextFormField(
                       readOnly:canRead ,
                      controller: email,
                        decoration: const InputDecoration(
                          labelText: ('Email'),
                        ),
                      ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
