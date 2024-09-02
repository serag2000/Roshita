// To parse this JSON data, do
//
//     final showInvoice = showInvoiceFromJson(jsonString);

import 'dart:convert';

ShowInvoice showInvoiceFromJson(String str) => ShowInvoice.fromJson(json.decode(str));

String showInvoiceToJson(ShowInvoice data) => json.encode(data.toJson());

class ShowInvoice {
    int id;
    int cartQty;
    String productName;

    ShowInvoice({
        required this.id,
        required this.cartQty,
        required this.productName,
    });

    factory ShowInvoice.fromJson(Map<String, dynamic> json) => ShowInvoice(
        id: json["id"],
        cartQty: json["cartQty"],
        productName: json["productName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cartQty": cartQty,
        "productName": productName,
    };
}
