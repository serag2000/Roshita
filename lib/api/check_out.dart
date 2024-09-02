import 'package:http/http.dart' as http;
import 'package:project/helper/const.dart';


class CeckOutApi{
  
static String url = "http://192.168.66.48:8000/api/userAuth/order";
   static Future<int> checkOut({ required String address, required String Phone}) async{
    String token = await getToken();
    http.Response res = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token'
      },
      body: {
        'address': address,
        'phone':Phone
      }
      );
      return res.statusCode;
  }
}