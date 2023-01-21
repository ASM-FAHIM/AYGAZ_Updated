// To parse this JSON data, do
//
//     final paymentApiModel = paymentApiModelFromJson(jsonString);

import 'dart:convert';

List<PaymentApiModel> paymentApiModelFromJson(String str) => List<PaymentApiModel>.from(json.decode(str).map((x) => PaymentApiModel.fromJson(x)));

String paymentApiModelToJson(List<PaymentApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentApiModel {
  PaymentApiModel({
    required this.xtype,
    required this.xamount,
  });

  dynamic xtype;
  dynamic xamount;

  factory PaymentApiModel.fromJson(Map<String, dynamic> json) => PaymentApiModel(
    xtype: json["xtype"],
    xamount: json["xamount"],
  );

  Map<String, dynamic> toJson() => {
    "xtype": xtype,
    "xamount": xamount,
  };
}
