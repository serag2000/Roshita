// To parse this JSON data, do
//
//     final showCart = showCartFromJson(jsonString);

import 'dart:convert';

CartItem showCartFromJson(String str) => CartItem.fromJson(json.decode(str));

String showCartToJson(CartItem data) => json.encode(data.toJson());

class CartItem {
    int id;
    int cartQty;
    String productTitle;
    double total;

    CartItem({
        required this.id,
        required this.cartQty,
        required this.productTitle,
        required this.total,
    });

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        cartQty: json["cartQty"],
        productTitle: json["productTitle"],
        total: json["total"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cartQty": cartQty,
        "productTitle": productTitle,
        "total": total,
    };
}
