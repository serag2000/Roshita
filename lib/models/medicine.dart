// To parse this JSON data, do
//
//     final medicine = medicineFromJson(jsonString);

import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
    int id;
    String title;
    String description;
    double price;
    int qtyInStock;
    String imgUrl1;
    int categoryId;
    DateTime createdAt;
    DateTime updatedAt;

    Medicine({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.qtyInStock,
        required this.imgUrl1,
        required this.categoryId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
