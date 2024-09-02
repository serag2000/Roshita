// To parse this JSON data, do
//
//     final allDoctors = allDoctorsFromJson(jsonString);

import 'dart:convert';

AllDoctors allDoctorsFromJson(String str) => AllDoctors.fromJson(json.decode(str));

String allDoctorsToJson(AllDoctors data) => json.encode(data.toJson());

class AllDoctors {
    int id;
    String name;
    String email;
    String phoneNumber;
    String specilization;
    String gender;
    dynamic imgUrl;
    DateTime createdAt;
    DateTime updatedAt;

    AllDoctors({
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

    factory AllDoctors.fromJson(Map<String, dynamic> json) => AllDoctors(
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
