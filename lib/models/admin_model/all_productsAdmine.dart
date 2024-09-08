import 'dart:convert';

ProductControl productControlFromJson(String str) => ProductControl.fromJson(json.decode(str));

String productControlToJson(ProductControl data) => json.encode(data.toJson());

class ProductControl {
    int id;
    String title;
    String description;
    int price;
    int qtyInStock;
    String imgUrl1;
    int categoryId;
     String parcode;
    DateTime createdAt;
    DateTime updatedAt;

    ProductControl({
        required this.id,
        required this.title,
        
        required this.description,
        required this.price,
        required this.qtyInStock,
        required this.imgUrl1,
        required this.categoryId,
        required this.parcode,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ProductControl.fromJson(Map<String, dynamic> json) => ProductControl(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        qtyInStock: json["qtyInStock"],
        imgUrl1: json["imgUrl1"],
        categoryId: json["categoryId"],
        parcode: json["parcode"],
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
         "parcode": parcode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
