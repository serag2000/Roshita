import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/user_profile.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/models/user_profile.dart';



class EditProfile extends StatefulWidget {
   EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();


}

class _EditProfileState extends State<EditProfile> {
  final forkey = GlobalKey<FormState>();
    final _api = ShowUserProfile();
  UserProfile data = UserProfile(id: 0, name: 'unkown', email: 'ff') ;
  bool isLoading = false;
  bool canEdit = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();

Future<void> getUser({required BuildContext context}) async {
   try{
   
     setState(() {
           isLoading =true;             
                    });  
     var response = await _api.getUserProfile('api/userAuth/userProfile');
    var result = jsonDecode(response.body)['data'];
    if (kDebugMode) {
      print(result);
      print(response.statusCode);
      print(response.body);
    }
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      data = UserProfile.fromJson(json);
      name.text = data.name;
      email.text = data.email;
      passwordController.clear();
    } else {
      if (kDebugMode) {
        // print("response.statusCode ===> ${response.statusCode}");
        print("data ====> $data");
      }
      if (kDebugMode) {
        print("response ===> ${response.body}");
      }
      if (kDebugMode) {
        print(response.body);
      }
      if (kDebugMode) {
        print(response.statusCode);
      }
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
  
  
Future<void> editUser({required BuildContext context,required UserProfile data, required String password}) async {
   try{
   
     setState(() {
           isLoading =true;             
                    });  
     var response = await _api.putUserProfile('api/userAuth/updateProfile',
     {
      'name': data.name,
       'email': data.email,
       'password':password,
     }
     );
    
 
    if (response.statusCode == 200) {
      
      name.text = data.name;
      mySnackBarBack(context, 'Done');
    } else {
      if (kDebugMode) {
        // print("response.statusCode ===> ${response.statusCode}");
        print("data ====> $data");
      }
      if (kDebugMode) {
        print("response ===> ${response.body}");
      }
      if (kDebugMode) {
        print(response.body);
      }
      if (kDebugMode) {
        print(response.statusCode);
      }
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
  
  
  @override
  void initState() {
    getUser(context: context);
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title:
            const Text('Edit Profile', style: TextStyle(color: Colors.black)),
      ),
      body: isLoading?
        const Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
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
                        backgroundImage: AssetImage('assets/images/gust.png'),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: IconButton(
                          icon: const Icon(Icons.edit,
                              color: Color.fromARGB(255, 104, 177, 237),
                              size: 19),
                          onPressed: () {

                        
                          },
                        ),
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
                      readOnly: !canEdit,
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
                      controller: email,
                      readOnly: !canEdit,
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
                      readOnly: !canEdit,
                      controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: ('Password'),
                        ),
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      canEdit = !canEdit;
                    });                    
                    // if (forkey.currentState!.validate()) {
                     
                    // }
                  },
                  child: Container(
                    width: double.infinity,
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
              ),
                Visibility(
                  visible: canEdit, //لما يكون المتغير هضا ترو تظهر الحفظ
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: () {
                                 
                      if (forkey.currentState!.validate()) {
                        data.name = name.text;
                        data.email = email.text;
                        canEdit = false;
                        passwordController.clear();
                        editUser(context: context, data: data, password: passwordController.text);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: size.width / 11,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.blue, width: 2),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
