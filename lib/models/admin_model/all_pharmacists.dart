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

    AllPharmacists({
        required this.id,
        required this.name,
        required this.email,

    });

    factory AllPharmacists.fromJson(Map<String, dynamic> json) => AllPharmacists(
        id: json["id"],
        name: json["name"],
        email: json["email"],

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,

    };
}
