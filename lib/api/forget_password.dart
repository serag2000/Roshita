import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project/helper/const.dart';

String baseUrl = "http://192.168.66.48:8000/";
class forgetPasswordApi{
 
   Future<Response> forgetPass({required String url, required String email}) async {
  
    final res = await http.post( 
       Uri.parse("$baseUrl$url"),
      headers: {
          'Accept': 'application/json',
      },
      body: {
        'email':email
      }
    );
    return res;
 }

 Future<Response> resetPass({required String url, required String email, required String otp, required String newPassword}) async {
  
    final res = await http.post( 
       Uri.parse("$baseUrl$url"),
      headers: {
          'Accept': 'application/json',
      },
      body:{
        'email':email,
        'otp': otp,
        'newPassword': newPassword,
        
      }
    );
    return res;
 }
}