import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/helper/const.dart';
import 'package:project/tabs_screen.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _loadUserInfo() async {
    String token = await getToken();
    if(kDebugMode){
      print("token $token");
    }
    if (token == '') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(builder: (context) => TabsScreen()), (route) => false);
    }
  }

  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}