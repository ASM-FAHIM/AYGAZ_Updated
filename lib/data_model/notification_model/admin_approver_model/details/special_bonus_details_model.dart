// To parse this JSON data, do
//
//     final specialRateModel = specialRateModelFromJson(jsonString);

import 'dart:convert';

List<SpecialRateModel> specialRateModelFromJson(String str) =>
    List<SpecialRateModel>.from(
        json.decode(str).map((x) => SpecialRateModel.fromJson(x)));

String specialRateModelToJson(List<SpecialRateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecialRateModel {
  SpecialRateModel({
    required this.xitem,
    required this.xdesc,
    required this.xrate,
    required this.xdateeff,
    required this.xdateexp,
    required this.zactive,
  });

  dynamic xitem;
  dynamic xdesc;
  dynamic xrate;
  dynamic xdateeff;
  dynamic xdateexp;
  dynamic zactive;

  factory SpecialRateModel.fromJson(Map<String, dynamic> json) =>
      SpecialRateModel(
        xitem: json["xitem"],
        xdesc: json["xdesc"],
        xrate: json["xrate"],
        xdateeff: Xdatee.fromJson(json["xdateeff"]),
        xdateexp: Xdatee.fromJson(json["xdateexp"]),
        zactive: json["zactive"],
      );

  Map<String, dynamic> toJson() => {
        "xitem": xitem,
        "xdesc": xdesc,
        "xrate": xrate,
        "xdateeff": xdateeff.toJson(),
        "xdateexp": xdateexp.toJson(),
        "zactive": zactive,
      };
}

class Xdatee {
  Xdatee({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Xdatee.fromJson(Map<String, dynamic> json) => Xdatee(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
