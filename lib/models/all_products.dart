// To parse this JSON data, do
//
//     final allProduct = allProductFromJson(jsonString);

import 'dart:convert';

AllProduct allProductFromJson(String str) => AllProduct.fromJson(json.decode(str));

String allProductToJson(AllProduct data) => json.encode(data.toJson());

class AllProduct {
    int? id;
    String? title;
    String ?description;
    double ?price;
    int ?qtyInStock;
    String? imgUrl1;
    int ?categoryId;
    DateTime? createdAt;
    DateTime ?updatedAt;

    AllProduct({
        this.id,
        this.title,
        this.description,
        this.price,
        this.qtyInStock,
        this.imgUrl1,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
    });

    factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        qtyInStock: json["qtyInStock"],
        imgUrl1: json["imgUrl1"],
        categoryId: json["categoryId"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "qtyInStock": qtyInStock,
        "imgUrl1": imgUrl1,
        "categoryId": categoryId,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
    };
}
