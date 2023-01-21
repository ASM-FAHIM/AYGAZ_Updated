// To parse this JSON data, do
//
//     final tsoListModel = tsoListModelFromJson(jsonString);

import 'dart:convert';

List<TsoListModel?>? tsoListModelFromJson(String str) => json.decode(str) == null ? [] : List<TsoListModel?>.from(json.decode(str)!.map((x) => TsoListModel.fromJson(x)));

String tsoListModelToJson(List<TsoListModel?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class TsoListModel {
  TsoListModel({
    this.xstaff,
    this.xsp,
    this.xsubcat,
    this.xterritory,
  });

  String? xstaff;
  String? xsp;
  String? xsubcat;
  String? xterritory;

  factory TsoListModel.fromJson(Map<String, dynamic> json) => TsoListModel(
    xstaff: json["xstaff"],
    xsp: json["xsp"],
    xsubcat: json["xsubcat"],
    xterritory: json["xterritory"],
  );

  Map<String, dynamic> toJson() => {
    "xstaff": xstaff,
    "xsp": xsp,
    "xsubcat": xsubcat,
    "xterritory": xterritory,
  };
}
