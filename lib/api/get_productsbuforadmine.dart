import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:project/helper/const.dart';

class ProductAdminApi{
 // String baseUrl = "http://192.168.0.106:8000/";
String baseUrl = "http://192.168.66.48:8000/";

 Future<Response> getproductAdmin(url) async {
      String token = await getToken();
    Response res = await http.get(
      Uri.parse("$baseUrl$url"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      },
    
      );
      return res;
  }
   get(Uri parse) {}
}