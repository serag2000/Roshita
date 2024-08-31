

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';

import 'package:project/helper/const.dart';
import 'package:project/models/show_cart.dart';


String baseUrl = "http://192.168.66.48:8000/";
class CartApi{
  Future<Response> addToCart({required String url, required int productId}) async{
    String token = await getToken();
    Response res = await http.post(
      Uri.parse("$baseUrl$url"),
      headers: {
        'Authorization': 'Bearer $token'
      },
      body: {
        'productId': productId.toString(),
        'qty':'3'
      }
      );
      return res;
  }

  get(Uri parse) {}

//    Future<List<CartItem>> getCartItems() async {
//   final response = await http.get(Uri.parse('/api/cart'));
//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     return data.map((item) => CartItem.fromJson(item)).toList();
//   } else {
//     throw Exception('Failed to load cart items');
//   }
// }
//  Future<Response> showcart(url) async {
//     //String token = "efjhksdgfewrufhl wiheohferhfv eocghfne"
//     if (kDebugMode) {
//       print("GET ON $baseUrl$url");
//     }
//     final res = await http.get(Uri.parse("$baseUrl$url"), headers: {
//       'Accept': 'application/json',
//       //'Authorization': 'Bearer $token'
//     });
//     return res;
//  }

//  Future<Response> showInvoice(url) async {
//     //String token = "efjhksdgfewrufhl wiheohferhfv eocghfne"
//     if (kDebugMode) {
//       print("GET ON $baseUrl$url");
//     }
//     final res = await http.get(Uri.parse("$baseUrl$url"), headers: {
//       'Accept': 'application/json',
//       //'Authorization': 'Bearer $token'
//     });
//     return res;
//  }
 
//    Future<Response> chickout({required String url, required int productId}) async{
//     String token = await getToken();
//     Response res = await http.post(
//       Uri.parse("$baseUrl$url"),
//       headers: {
//         'Authorization': 'Bearer $token'
//       },
//       body: {
//         'productId': productId.toString(),
//         'qty':'3'
//       }
//       );
//       return res;
//   }


}