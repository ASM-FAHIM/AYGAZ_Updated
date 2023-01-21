// To parse this JSON data, do
//
//     final termsModel = termsModelFromJson(jsonString);

import 'dart:convert';

List<TermsModel> termsModelFromJson(String str) =>
    List<TermsModel>.from(json.decode(str).map((x) => TermsModel.fromJson(x)));

String termsModelToJson(List<TermsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TermsModel {
  TermsModel({
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xpornum,
    required this.xrow,
    required this.xcode,
    required this.xnote,
  });

  dynamic ztime;
  dynamic zutime;
  String zauserid;
  String zuuserid;
  int zid;
  String xpornum;
  dynamic xrow;
  dynamic xcode;
  dynamic xnote;

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        ztime: json["ztime"],
        zutime: json["zutime"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        zid: json["zid"],
        xpornum: json["xpornum"],
        xrow: json["xrow"],
        xcode: json["xcode"],
        xnote: json["xnote"],
      );

  Map<String, dynamic> toJson() => {
        "ztime": ztime.toJson(),
        "zutime": zutime.toJson(),
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "zid": zid,
        "xpornum": xpornum,
        "xrow": xrow,
        "xcode": xcode,
        "xnote": xnote,
      };
}

class Time {
  Time({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  dynamic timezone;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
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
