// To parse this JSON data, do
//
//     final showCart = showCartFromJson(jsonString);

import 'dart:convert';

CartItem showCartFromJson(String str) => CartItem.fromJson(json.decode(str));



class CartItem {
    int id;
    int cartQty;
    String productTitle;
    double total;
    double price;

    CartItem({
      required this.price,
        required this.id,
        required this.cartQty,
        required this.productTitle,
        required this.total,
    });

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["pId"],
        cartQty: json["cartQty"],
        price: json['price']?.toDouble(),
        productTitle: json["productTitle"],
        total: json["total"]?.toDouble(),

    );

  
}
