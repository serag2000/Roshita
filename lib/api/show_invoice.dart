import 'package:http/http.dart';
import 'package:project/helper/const.dart';

String baseUrl = "http://192.168.66.48:8000/";
class ShowCartApi{
  get http => null;

  Future<Response> showInvoice(url) async{
    String token = await getToken();
    Response res = await http.get(
      Uri.parse("$baseUrl$url"),
      headers: {
        'Authorization': 'Bearer $token'
      },
    
      );
      return res;
  }

  get(Uri parse) {}
  
}