import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:project/helper/const.dart';

String baseUrl = "http://192.168.66.48:8000/";
class ShowInvoiceApi{


  Future<Response> getshowInvoice(url) async{
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