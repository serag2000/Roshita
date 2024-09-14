  import 'package:http/http.dart';
  import 'package:http/http.dart'as http;


import 'package:project/helper/const.dart';
class CheckUserApi{
  String baseUrl = "http://192.168.66.48:8000/";
  Future<Response> checkuser({required String url,required  String email}) async{
   String token = await getToken();
    Response res = await http.post(
      Uri.parse("$baseUrl$url"),
      headers: {
       'Authorization': 'Bearer $token',
      },
      body: {
       'email':email,
      }
      );
      return res;
  }
}