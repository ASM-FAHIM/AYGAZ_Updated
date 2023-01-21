// To parse this JSON data, do
//
//     final spotPurchaseDetail = spotPurchaseDetailFromJson(jsonString);

import 'dart:convert';

List<SpotPurchaseDetail> spotPurchaseDetailFromJson(String str) => List<SpotPurchaseDetail>.from(json.decode(str).map((x) => SpotPurchaseDetail.fromJson(x)));

String spotPurchaseDetailToJson(List<SpotPurchaseDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpotPurchaseDetail {
  SpotPurchaseDetail({
    required this.xrow,
    required this.xitem,
    required this.description,
    required this.xbrand,
    required this.xqtyreq,
    required this.xqtyapv,
    required this.xunitpur,
    required this.xrate,
    required this.xlineamt,
  });

  int xrow;
  String xitem;
  String description;
  String xbrand;
  String xqtyreq;
  String xqtyapv;
  String xunitpur;
  String xrate;
  String xlineamt;

  factory SpotPurchaseDetail.fromJson(Map<String, dynamic> json) => SpotPurchaseDetail(
    xrow: json["xrow"],
    xitem: json["xitem"],
    description: json["description"],
    xbrand: json["xbrand"],
    xqtyreq: json["xqtyreq"],
    xqtyapv: json["xqtyapv"],
    xunitpur: json["xunitpur"],
    xrate: json["xrate"],
    xlineamt: json["xlineamt"],
  );

  Map<String, dynamic> toJson() => {
    "xrow": xrow,
    "xitem": xitem,
    "description": description,
    "xbrand": xbrand,
    "xqtyreq": xqtyreq,
    "xqtyapv": xqtyapv,
    "xunitpur": xunitpur,
    "xrate": xrate,
    "xlineamt": xlineamt,
  };
}
