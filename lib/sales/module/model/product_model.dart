// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    required this.xitem,
    required this.xdesc,
    required this.xrate,
    required this.xvatrate,
    required this.xvatamt,
    required this.totrate,
    required this.xpackqty,
    required this.xunitsel,
    required this.xdisc,
    required this.xdiscstatus,
    required this.note,
  });

  int? id;
  String xitem;
  String xdesc;
  String xrate;
  String xvatrate;
  String xvatamt;
  String totrate;
  String xpackqty;
  String xunitsel;
  String xdisc;
  String xdiscstatus;
  String note;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    xitem: json["xitem"],
    xdesc: json["xdesc"],
    xrate: json["xrate"],
    xvatrate: json["xvatrate"],
    xvatamt: json["xvatamt"],
    totrate: json["totrate"],
    xpackqty: json["xpackqty"],
    xunitsel: json["xunitsel"],
    xdisc: json["xdisc"],
    xdiscstatus: json["xdiscstatus"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "xitem": xitem,
    "xdesc": xdesc,
    "xrate": xrate,
    "xvatrate": xvatrate,
    "xvatamt": xvatamt,
    "totrate": totrate,
    "xpackqty": xpackqty,
    "xunitsel": xunitsel,
    "xdisc": xdisc,
    "xdiscstatus": xdiscstatus,
    "note": note,
  };
}
