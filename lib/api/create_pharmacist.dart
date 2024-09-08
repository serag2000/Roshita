import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project/helper/const.dart';
import 'package:http/http.dart';

String baseUrl = "http://192.168.66.48:8000/";

class CreatePhatmacistApi {


  Future<Response> removePharmatistic({
    required String url,
  
  }) async {
    //String token = "efjhksdgfewrufhl wiheohferhfv eocghfne"
    if (kDebugMode) {
      print("put $baseUrl$url");
    }
    String token = await getToken();
    final res = await http.delete(
        Uri.parse("$baseUrl$url"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    return res;
  }

  Future<Response> putPhatmacist({
    required String url,
    required String name,
    required String email,
    required String password,
  }) async {
    //String token = "efjhksdgfewrufhl wiheohferhfv eocghfne"
    if (kDebugMode) {
      print("put $baseUrl$url");
    }
    String token = await getToken();
    final res = await http.put(
        body: {'name': name, 'email': email, 'password': password},
        Uri.parse("$baseUrl$url"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    return res;
  }

  get(Uri parse) {}

  Future<Response> addToPhatmacist({
    required String url,
    required String name,
    required String email,
    required String password,
  }) async {
    String token = await getToken();
    Response res = await http.post(Uri.parse("$baseUrl$url"), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      'name': name,
      'email': email,
      'password': password
    });
    return res;
  }
}
