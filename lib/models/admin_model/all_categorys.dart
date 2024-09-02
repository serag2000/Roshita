// To parse this JSON data, do
//
//     final allCategory = allCategoryFromJson(jsonString);

import 'dart:convert';

AllCategory allCategoryFromJson(String str) => AllCategory.fromJson(json.decode(str));

String allCategoryToJson(AllCategory data) => json.encode(data.toJson());

class AllCategory {
    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    AllCategory({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
