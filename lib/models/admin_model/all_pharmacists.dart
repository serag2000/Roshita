// To parse this JSON data, do
//
//     final allPharmacists = allPharmacistsFromJson(jsonString);

import 'dart:convert';

AllPharmacists allPharmacistsFromJson(String str) => AllPharmacists.fromJson(json.decode(str));

String allPharmacistsToJson(AllPharmacists data) => json.encode(data.toJson());

class AllPharmacists {
    int id;
    String name;
    String email;
    String imgUrl;
    DateTime createdAt;
    DateTime updatedAt;

    AllPharmacists({
        required this.id,
        required this.name,
        required this.email,
        required this.imgUrl,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AllPharmacists.fromJson(Map<String, dynamic> json) => AllPharmacists(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        imgUrl: json["imgUrl"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "imgUrl": imgUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
