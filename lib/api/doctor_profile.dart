import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:project/helper/const.dart';

class ShowDoctorProfile{
 // String baseUrl = "http://192.168.0.106:8000/";
String baseUrl = "http://192.168.66.48:8000/";


  Future<Response> getdoctorProfile(url) async {
    
    //String token = "efjhksdgfewrufhl wiheohferhfv eocghfne"
    if (kDebugMode) {
      print("GET ON $baseUrl$url");
    }
    String token = await getToken();
    final res = await http.get(Uri.parse("$baseUrl$url"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return res;
 }
  get(Uri parse) {}

  
  
}