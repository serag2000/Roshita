// To parse this JSON data, do
//
//     final userdoctors = userdoctorsFromJson(jsonString);

import 'dart:convert';

Userdoctors userdoctorsFromJson(String str) => Userdoctors.fromJson(json.decode(str));

String userdoctorsToJson(Userdoctors data) => json.encode(data.toJson());

class Userdoctors {
    int id;
    String name;
    String email;
    String phoneNumber;
    String specilization;
    String gender;
    dynamic imgUrl;
    DateTime createdAt;
    DateTime updatedAt;

    Userdoctors({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.specilization,
        required this.gender,
        required this.imgUrl,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Userdoctors.fromJson(Map<String, dynamic> json) => Userdoctors(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        specilization: json["specilization"],
        gender: json["gender"],
        imgUrl: json["imgUrl"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "specilization": specilization,
        "gender": gender,
        "imgUrl": imgUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
