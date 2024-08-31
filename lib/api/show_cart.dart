import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';

import 'package:project/helper/const.dart';
import 'package:project/models/show_cart.dart';


// class ShowCartService {
//   Future<List<CartItem>?> getShow(dynamic userId) async {
//     var client = http.Client();
//     var url = Uri.parse('http://192.168.66.48:8000/api/$userId/cart');
//   }
// }





String baseUrl = "http://192.168.66.48:8000/";
class ShowCartApi{
  Future<Response> showCart(url) async{
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