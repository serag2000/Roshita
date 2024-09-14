// To parse this JSON data, do
//
//     final medicine = medicineFromJson(jsonString);

import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
    int id;
    String title;


    Medicine({
        required this.id,
        required this.title,
    
    });

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        title: json["title"],
    
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    
    };
}
