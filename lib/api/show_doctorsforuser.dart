
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
//String baseUrl = "http://192.168.66.48:8000/";
// class ShowDoctors{
//   static Future<List<Userdoctors>> getAllDoctors() async {
//     //business logic to send data to server
//     final Response response = await get('$baseUrl/api/doctros' as Uri,
//     headers: {
//         'Authorization': 'application/json'
//       },
//     );

//     if (response.statusCode == 200) {
//       //print(response.body);
//       //parse json into list of objects
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//       return parsed.map<Userdoctors>((item) => Userdoctors.fromJson(item)).toList();
//       //return Author.fromJson(json.decode(response.body));
      
//     } else {
//       //print('Error');
//       throw Exception("Can't load author");
//     }
//   }
  
//   }
class ShowDoctors{
 // String baseUrl = "http://192.168.0.106:8000/";
String baseUrl = "http://192.168.66.48:8000/";

  Future<Response> getAllDoctors(url) async {
    if (kDebugMode) {
      print("GET ON $baseUrl$url");
    }
    final res = await http.get(Uri.parse("$baseUrl$url"), headers: {
      'Accept': 'application/json',
      //'Authorization': 'Bearer $token'
    });
    return res;
 }
 
}