// To parse this JSON data, do
//
//     final creditInfoModel = creditInfoModelFromJson(jsonString);

import 'dart:convert';

List<CreditInfoModel> creditInfoModelFromJson(String str) =>
    List<CreditInfoModel>.from(
        json.decode(str).map((x) => CreditInfoModel.fromJson(x)));

String creditInfoModelToJson(List<CreditInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreditInfoModel {
  CreditInfoModel({
    required this.xinvtoinvcr,
    required this.xcrtermtype,
    required this.xcrterms,
    required this.xcrlimit,
    required this.xcrused,
    required this.xref,
    required this.xdateeff,
    required this.xdateexp,
    required this.xallowcrinv,
    required this.xallbndisc,
  });

  dynamic xinvtoinvcr;
  dynamic xcrtermtype;
  int xcrterms;
  dynamic xcrlimit;
  dynamic xcrused;
  dynamic xref;
  dynamic xdateeff;
  dynamic xdateexp;
  dynamic xallowcrinv;
  dynamic xallbndisc;

  factory CreditInfoModel.fromJson(Map<String, dynamic> json) =>
      CreditInfoModel(
        xinvtoinvcr: json["xinvtoinvcr"],
        xcrtermtype: json["xcrtermtype"],
        xcrterms: json["xcrterms"],
        xcrlimit: json["xcrlimit"],
        xcrused: json["xcrused"],
        xref: json["xref"],
        xdateeff: Xdatee.fromJson(json["xdateeff"]),
        xdateexp: Xdatee.fromJson(json["xdateexp"]),
        xallowcrinv: json["xallowcrinv"],
        xallbndisc: json["xallbndisc"],
      );

  Map<String, dynamic> toJson() => {
        "xinvtoinvcr": xinvtoinvcr,
        "xcrtermtype": xcrtermtype,
        "xcrterms": xcrterms,
        "xcrlimit": xcrlimit,
        "xcrused": xcrused,
        "xref": xref,
        "xdateeff": xdateeff.toJson(),
        "xdateexp": xdateexp.toJson(),
        "xallowcrinv": xallowcrinv,
        "xallbndisc": xallbndisc,
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
