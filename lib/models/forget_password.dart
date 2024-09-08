import 'dart:convert';

ForgetPassword forgetPasswordFromJson(String str) => ForgetPassword.fromJson(json.decode(str));

String forgetPasswordToJson(ForgetPassword data) => json.encode(data.toJson());

class ForgetPassword {
    String stasut;
    int otp;

    ForgetPassword({
        required this.stasut,
        required this.otp,
    });

    factory ForgetPassword.fromJson(Map<String, dynamic> json) => ForgetPassword(
        stasut: json["stasut"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "stasut": stasut,
        "otp": otp,
    };
}
