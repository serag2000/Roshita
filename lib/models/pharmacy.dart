

import 'dart:convert';

Pharmacy pharmacyFromJson(String str) => Pharmacy.fromJson(json.decode(str));

String pharmacyToJson(Pharmacy data) => json.encode(data.toJson());

class Pharmacy {
    String userEmail;
    String userName;
    String birthday;
    String doctorName;
    String specilization;
    String medicine1;
    String time1;
    dynamic medicine2;
    dynamic time2;
    String medicine3;
    String time3;
    String medicine4;
    String time4;
    String medicine5;
    String time5;
    dynamic decription;
    int status;
    DateTime time;
    int id;

    Pharmacy({
        required this.id,
        required this.userEmail,
        required this.userName,
        required this.birthday,
        required this.doctorName,
        required this.specilization,
        required this.medicine1,
        required this.time1,
        required this.medicine2,
        required this.time2,
        required this.medicine3,
        required this.time3,
        required this.medicine4,
        required this.time4,
        required this.medicine5,
        required this.time5,
        required this.decription,
        required this.status,
        required this.time,
    });

    factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        id: json['id'],
        userEmail: json["userEmail"],
        userName: json["userName"],
        birthday:json['birthday'],
        doctorName: json["doctorName"],
        specilization: json["specilization"],
        medicine1: json["medicine1"],
        time1: json["time1"],
        medicine2: json["medicine2"]??'',
        time2: json["time2"]??'',
        medicine3: json["medicine3"]??'',
        time3: json["time3"]??'',
        medicine4: json["medicine4"]??'',
        time4: json["time4"]??'',
        medicine5: json["medicine5"]??'',
        time5: json["time5"]??'',
        decription: json["decription"]??'',
        status: json["status"],
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "userEmail": userEmail,
        "userName": userName,
        "birthday":birthday,
        "doctorName": doctorName,
        "specilization": specilization,
        "medicine1": medicine1,
        "time1": time1,
        "medicine2": medicine2,
        "time2": time2,
        "medicine3": medicine3,
        "time3": time3,
        "medicine4": medicine4,
        "time4": time4,
        "medicine5": medicine5,
        "time5": time5,
        "decription": decription,
        "status": status,
        "time": time.toIso8601String(),
    };
}
