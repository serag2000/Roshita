// import 'dart:convert';

// import 'package:http/http.dart';
// import 'package:project/models/all_products.dart';

// class API {
//   static const String _BASE_URL = 'http://192.168.66.48:8000/';
//   static Future<AllProduct> createAuthor(AllProduct allproduct) async {
//     //business logic to send data to server
//     final Response response = await post('$_BASE_URL/allProduct' as Uri,
//         headers: <String, String>{
//           'Accept': 'application/json;charset=UTF-8'
//         },
//         body: jsonEncode(allproduct.toJson()));

//     if (response.statusCode == 200) {
//       //print(response.body);
//       return AllProduct.fromJson(json.decode(response.body));
//     } else {
//       //print('Error');
//       throw Exception("Can't load author");
//     }
//   }

//   static Future<List<AllProduct>> getAllAuthors() async {
//     //business logic to send data to server
//     final Response response = await get('$_BASE_URL/allProduct' as Uri);

//     if (response.statusCode == 200) {
//       //print(response.body);
//       //parse json into list of objects
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//       return parsed.map<AllProduct>((item) => AllProduct.fromJson(item)).toList();
//       //return Author.fromJson(json.decode(response.body));
//     } else {
//       //print('Error');
//       throw Exception("Can't load author");
//     }
//   }

//   static Future<Response> deleteAuthor(int id) async {
//     //business logic to send data to server
//     final Response response = await delete('$_BASE_URL/allProduct/$id' as Uri,
//         headers: <String, String>{
//           'Content-Type': 'application/json;charset=UTF-8'
//         });

//     if (response.statusCode == 200) {
//       //print(response.body);
//       return response;
//     } else {
//       //print('Error');
//       throw Exception("Can't load author");
//     }
//   }

//   static Future<Response> updateAuthor(AllProduct allProduct) async {
//     //business logic to send data to server
//     final Response response = await put('$_BASE_URL/allProduct/${allProduct.id}' as Uri,
//         headers: <String, String>{
//           'Content-Type': 'application/json;charset=UTF-8'
//         },
//         body: jsonEncode(allProduct.toJson()));

//     if (response.statusCode == 200) {
//       print(response.body);
//       return response;
//       //return Author.fromJson(json.decode(response.body));
//     } else {
//       //print('Error');
//       throw Exception("Can't load author");
//     }
//   }
// }