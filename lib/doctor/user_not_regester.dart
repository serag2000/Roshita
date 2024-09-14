import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/check_user_email.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/doctor/add_description.dart';


class UserNotRegester extends StatefulWidget {
  const UserNotRegester({super.key});

  @override
  State<UserNotRegester> createState() => _UserNotRegesterState();
}

class _UserNotRegesterState extends State<UserNotRegester> {
  final CheckUserApi _api = CheckUserApi();
  bool isLoading = false;




  Future<void> check({required BuildContext context,required String userEmail})async{
    setState(() {
      isLoading = true;
    });
    try{

          var response = await _api.checkuser(
          email: usernameController.text,
          url: 'api/doctorAuth/checkUser');
      var result = jsonDecode(response.body);
      
      if(response.statusCode !=200){
        mySnackBarBack(context, result['message']);
      }else{
        mySnackBarBack(context, 'done');
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => AddDescription(userEmail: userEmail),));

      }
      if (kDebugMode) {
        print(userEmail);
       
      }
     
    }catch(e){
      mySnackBarBack(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Roshita.png', width: 150),
          const Text('Please Inter Your Email',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: 'Enter The User Email',
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          MaterialButton(
            onPressed: () {
              if(usernameController.text.isEmpty){
                mySnackBarBack(context, 'Please input The User Email');
              }else{
                check(context: context,userEmail: usernameController.text);
              }
            },
            child:isLoading?const Center(child: CircularProgressIndicator(),) : const Text('Check Email',
                style: TextStyle(
                  color: Colors.blue,
                )),
          )
        ],
      ),
    );
  }
}
