import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project/helper/const.dart';
import 'package:http/http.dart';



String baseUrl = "http://192.168.66.48:8000/";
class CreateProductApi{
 
   Future<Response> putProduct({required String url, required String title, required String description, required String price, required String qtyInStock, required String imgUrl1, required String categoryId, required String parcode}) async {
  
    //String token = "efjhksdgfewrufhl wiheohferhfv eocghfne"
    if (kDebugMode) {
      print("put $baseUrl$url");
    }
    String token = await getToken();
    final res = await http.put(
        body: {
        'title':title,
        'description':description,
        'price':price,
        'qtyInStock':qtyInStock,
        'imgUrl1': imgUrl1,
        'categoryId':categoryId,
        'parcode' : parcode
      },
      Uri.parse("$baseUrl$url"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return res;
 }
  get(Uri parse) {}


  Future<Response> addToProduct({required String url, required String title, required String description, required dynamic price, required dynamic qtyInStock, required String imgUrl1, required int categoryId, required String parcode}) async{
   String token = await getToken();
    
    Response res = await http.post(
      Uri.parse("$baseUrl$url"),
      headers: {
       'Authorization': 'Bearer $token',
       'Accept':'application/json'
      },
      body: 
        {
        'title':title,
        'description':description,
        'price':price,
        'qtyInStock':qtyInStock,
        'categoryId':categoryId.toString(),
        'parcode' : parcode,
        
      }
      );
      if (kDebugMode) {
        print( jsonEncode(
        {
        'title':title,
        'parcode' : parcode,
        'description':description,
        'price':price,
        'qtyInStock':qtyInStock,
        'categoryId':categoryId,
        
      }
      ),);
      }
      return res;
  }

  Future<Response> removeProduct({
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

 Future<Response> getProducts(url) async {
    //String token = "efjhksdgfewrufhl wiheohferhfv eocghfne"
    
 
    if (kDebugMode) {
      print("GET ON $baseUrl$url");
    }
     String token = await getToken();
    final res = await http.get(Uri.parse("$baseUrl$url"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return res;
 }
   Future<Response> getCategorey(url) async {
    //String token = "efjhksdgfewrufhl wiheohferhfv eocghfne"
    
 
    if (kDebugMode) {
      print("GET ON $baseUrl$url");
    }
     String token = await getToken();
    final res = await http.get(Uri.parse("$baseUrl$url"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
 
    return res;
 }
  
}

