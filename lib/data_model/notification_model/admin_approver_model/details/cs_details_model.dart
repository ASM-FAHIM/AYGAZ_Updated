// To parse this JSON data, do
//
//     final csDetailsModel = csDetailsModelFromJson(jsonString);

import 'dart:convert';

List<CsDetailsModel> csDetailsModelFromJson(String str) =>
    List<CsDetailsModel>.from(
        json.decode(str).map((x) => CsDetailsModel.fromJson(x)));

String csDetailsModelToJson(List<CsDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CsDetailsModel {
  CsDetailsModel({
    required this.ztime,
    required this.xdesc1,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xporeqnum,
    required this.xqotnum,
    required this.xrow,
    required this.xitem,
    required this.xnote,
    required this.xspec,
    required this.xqtyreq,
    required this.xunitpur,
    required this.xrate,
    required this.xdocrow,
    required this.xlineamt,
    required this.xcap1,
    required this.xdes1,
    required this.xcap2,
    required this.xdes2,
    required this.xcap3,
    required this.xdes3,
    required this.xcap4,
    required this.xdes4,
    required this.xcap5,
    required this.xdes5,
    required this.xcap6,
    required this.xdes6,
    required this.xcap7,
    required this.xdes7,
    required this.xcap8,
    required this.xdes8,
    required this.xcap9,
    required this.xdes9,
    required this.xcap10,
    required this.xdes10,
    required this.xcap11,
    required this.xdes11,
    required this.xcap12,
    required this.xdes12,
    required this.xcap13,
    required this.xdes13,
    required this.xcap14,
    required this.xdes14,
    required this.xcap15,
    required this.xdes15,
    required this.xquotrec,
  });

  Ztime ztime;
  dynamic zutime;
  dynamic xdesc1;
  dynamic zauserid;
  dynamic zuuserid;
  int zid;
  dynamic xporeqnum;
  dynamic xqotnum;
  int xrow;
  dynamic xitem;
  dynamic xnote;
  dynamic xspec;
  dynamic xqtyreq;
  dynamic xunitpur;
  dynamic xrate;
  int xdocrow;
  dynamic xlineamt;
  dynamic xcap1;
  dynamic xdes1;
  dynamic xcap2;
  dynamic xdes2;
  dynamic xcap3;
  dynamic xdes3;
  dynamic xcap4;
  dynamic xdes4;
  dynamic xcap5;
  dynamic xdes5;
  dynamic xcap6;
  dynamic xdes6;
  dynamic xcap7;
  dynamic xdes7;
  dynamic xcap8;
  dynamic xdes8;
  dynamic xcap9;
  dynamic xdes9;
  dynamic xcap10;
  dynamic xdes10;
  dynamic xcap11;
  dynamic xdes11;
  dynamic xcap12;
  dynamic xdes12;
  dynamic xcap13;
  dynamic xdes13;
  dynamic xcap14;
  dynamic xdes14;
  dynamic xcap15;
  dynamic xdes15;
  dynamic xquotrec;

  factory CsDetailsModel.fromJson(Map<String, dynamic> json) => CsDetailsModel(
        ztime: Ztime.fromJson(json["ztime"]),
        zutime: json["zutime"],
        xdesc1: json["xdesc1"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        zid: json["zid"],
        xporeqnum: json["xporeqnum"],
        xqotnum: json["xqotnum"],
        xrow: json["xrow"],
        xitem: json["xitem"],
        xnote: json["xnote"],
        xspec: json["xspec"],
        xqtyreq: json["xqtyreq"],
        xunitpur: json["xunitpur"],
        xrate: json["xrate"],
        xdocrow: json["xdocrow"],
        xlineamt: json["xlineamt"],
        xcap1: json["xcap1"],
        xdes1: json["xdes1"],
        xcap2: json["xcap2"],
        xdes2: json["xdes2"],
        xcap3: json["xcap3"],
        xdes3: json["xdes3"],
        xcap4: json["xcap4"],
        xdes4: json["xdes4"],
        xcap5: json["xcap5"],
        xdes5: json["xdes5"],
        xcap6: json["xcap6"],
        xdes6: json["xdes6"],
        xcap7: json["xcap7"],
        xdes7: json["xdes7"],
        xcap8: json["xcap8"],
        xdes8: json["xdes8"],
        xcap9: json["xcap9"],
        xdes9: json["xdes9"],
        xcap10: json["xcap10"],
        xdes10: json["xdes10"],
        xcap11: json["xcap11"],
        xdes11: json["xdes11"],
        xcap12: json["xcap12"],
        xdes12: json["xdes12"],
        xcap13: json["xcap13"],
        xdes13: json["xdes13"],
        xcap14: json["xcap14"],
        xdes14: json["xdes14"],
        xcap15: json["xcap15"],
        xdes15: json["xdes15"],
        xquotrec: json["xquotrec"],
      );

  Map<String, dynamic> toJson() => {
        "ztime": ztime.toJson(),
        "zutime": zutime,
        "xdesc1": xdesc1,
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "zid": zid,
        "xporeqnum": xporeqnum,
        "xqotnum": xqotnum,
        "xrow": xrow,
        "xitem": xitem,
        "xnote": xnote,
        "xspec": xspec,
        "xqtyreq": xqtyreq,
        "xunitpur": xunitpur,
        "xrate": xrate,
        "xdocrow": xdocrow,
        "xlineamt": xlineamt,
        "xcap1": xcap1,
        "xdes1": xdes1,
        "xcap2": xcap2,
        "xdes2": xdes2,
        "xcap3": xcap3,
        "xdes3": xdes3,
        "xcap4": xcap4,
        "xdes4": xdes4,
        "xcap5": xcap5,
        "xdes5": xdes5,
        "xcap6": xcap6,
        "xdes6": xdes6,
        "xcap7": xcap7,
        "xdes7": xdes7,
        "xcap8": xcap8,
        "xdes8": xdes8,
        "xcap9": xcap9,
        "xdes9": xdes9,
        "xcap10": xcap10,
        "xdes10": xdes10,
        "xcap11": xcap11,
        "xdes11": xdes11,
        "xcap12": xcap12,
        "xdes12": xdes12,
        "xcap13": xcap13,
        "xdes13": xdes13,
        "xcap14": xcap14,
        "xdes14": xdes14,
        "xcap15": xcap15,
        "xdes15": xdes15,
        "xquotrec": xquotrec,
      };
}

class Ztime {
  Ztime({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Ztime.fromJson(Map<String, dynamic> json) => Ztime(
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
