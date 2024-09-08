// To parse this JSON data, do
//
//     final pharmacistControl = pharmacistControlFromJson(jsonString);

import 'dart:convert';

PharmacistControl pharmacistControlFromJson(String str) => PharmacistControl.fromJson(json.decode(str));

String pharmacistControlToJson(PharmacistControl data) => json.encode(data.toJson());

class PharmacistControl {
    int id;
    String name;
    String email;
    String password;


    PharmacistControl({
        required this.id,
        required this.name,
        required this.email,
        required this.password

    });

    factory PharmacistControl.fromJson(Map<String, dynamic> json) => PharmacistControl(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"]

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        'password':password

    };
}
