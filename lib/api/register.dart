import 'package:http/http.dart';

String baseUrl = "http://192.168.66.48:8000/";
class CartApi{
  get http => null;

  Future<Response> addToCart({required String url, required String name,required String email,required String password}) async{
   // String token = await getToken();
    Response res = await http.post(
      Uri.parse("$baseUrl$url"),
      headers: {
       // 'Authorization': 'Bearer $token'
      },
      body: {
        'name':name,
        'email':email,
        'passwors':password
      }
      );
      return res;
  }

  get(Uri parse) {}
}