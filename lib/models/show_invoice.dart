// // To parse this JSON data, do
// //
// //     final showinvoice = showinvoiceFromJson(jsonString);

// import 'dart:convert';

// Showinvoice showinvoiceFromJson(String str) => Showinvoice.fromJson(json.decode(str));

// String showinvoiceToJson(Showinvoice data) => json.encode(data.toJson());

// class Showinvoice {
//     String userEmail;
//     List<Item> items;
//     double total;

//     Showinvoice({
//         required this.userEmail,
//         required this.items,
//         required this.total,
//     });

//     factory Showinvoice.fromJson(Map<String, dynamic> json) => Showinvoice(
//         userEmail: json["userEmail"],
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//         total: json["total"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "userEmail": userEmail,
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//         "total": total,
//     };
// }

// class Item {
//     int id;
//     int cartQty;
//     String productName;

//     Item({
//         required this.id,
//         required this.cartQty,
//         required this.productName,
//     });

//     factory Item.fromJson(Map<String, dynamic> json) => Item(
//         id: json["id"],
//         cartQty: json["cartQty"],
//         productName: json["productName"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "cartQty": cartQty,
//         "productName": productName,
//     };
// }
// To parse this JSON data, do
//
//     final showinvoice = showinvoiceFromJson(jsonString);

import 'dart:convert';

Showinvoice showinvoiceFromJson(String str) => Showinvoice.fromJson(json.decode(str));

String showinvoiceToJson(Showinvoice data) => json.encode(data.toJson());

class Showinvoice {
    int id;
    int cartQty;
    String productName;

    Showinvoice({
        required this.id,
        required this.cartQty,
        required this.productName,
    });

    factory Showinvoice.fromJson(Map<String, dynamic> json) => Showinvoice(
        id: json["id"],
        cartQty: json["cartQty"],
        productName: json["productName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cartQty": cartQty,
        "productName": productName,
    };
}
