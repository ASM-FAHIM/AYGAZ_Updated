// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

InvoiceModel? invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel? data) => json.encode(data!.toJson());

class InvoiceModel {
  InvoiceModel({
    this.xnetamt,
  });

  String? xnetamt;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    xnetamt: json["xnetamt"],
  );

  Map<String, dynamic> toJson() => {
    "xnetamt": xnetamt,
  };
}
