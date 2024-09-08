// To parse this JSON data, do
//
//     final doctorControl = doctorControlFromJson(jsonString);

import 'dart:convert';

DoctorControl doctorControlFromJson(String str) => DoctorControl.fromJson(json.decode(str));

String doctorControlToJson(DoctorControl data) => json.encode(data.toJson());

class DoctorControl {
    int id;
    String name;
    String email;
    String phoneNumber;
    String specilization;
    String gender;
    //dynamic imgUrl;
    //DateTime createdAt;
    //DateTime updatedAt;

    DoctorControl({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.specilization,
        required this.gender,
       //  this.imgUrl,
         //this.createdAt,
         //this.updatedAt,
    });

    factory DoctorControl.fromJson(Map<String, dynamic> json) => DoctorControl(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        specilization: json["specilization"],
        gender: json["gender"],
       // imgUrl: json["imgUrl"],
        //createdAt: DateTime.parse(json["created_at"]),
        //updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "specilization": specilization,
        "gender": gender,
        //"imgUrl": imgUrl,
        //"created_at": createdAt.toIso8601String(),
        //"updated_at": updatedAt.toIso8601String(),
    };
}
