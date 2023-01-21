// To parse this JSON data, do
//
//     final csModel = csModelFromJson(jsonString);

import 'dart:convert';

List<CsModel> csModelFromJson(String str) =>
    List<CsModel>.from(json.decode(str).map((x) => CsModel.fromJson(x)));

String csModelToJson(List<CsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CsModel {
  CsModel({
    required this.xtypeobj,
    required this.xnote,
    required this.xstatusreq,
    required this.xqotnum,
    required this.xporeqnum,
    required this.xdate,
    required this.xregi,
    required this.xtwh,
    required this.comp,
    required this.preparer,
    required this.designation,
    required this.deptname,
    required this.signname,
    required this.signdesignation,
    required this.signdeptname,
  });

  dynamic xtypeobj;
  dynamic xnote;
  dynamic xstatusreq;
  dynamic xqotnum;
  dynamic xporeqnum;
  Xdate xdate;
  dynamic xregi;
  dynamic xtwh;
  dynamic comp;
  dynamic preparer;
  dynamic designation;
  dynamic deptname;
  dynamic signname;
  dynamic signdesignation;
  dynamic signdeptname;

  factory CsModel.fromJson(Map<String, dynamic> json) => CsModel(
        xtypeobj: json["xtypeobj"],
        xnote: json["xnote"],
        xstatusreq: json["xstatusreq"],
        xqotnum: json["xqotnum"],
        xporeqnum: json["xporeqnum"],
        xdate: Xdate.fromJson(json["xdate"]),
        xregi: json["xregi"],
        xtwh: json["xtwh"],
        comp: json["comp"],
        preparer: json["preparer"],
        designation: json["designation"],
        deptname: json["deptname"],
        signname: json["signname"],
        signdesignation: json["signdesignation"],
        signdeptname: json["signdeptname"],
      );

  Map<String, dynamic> toJson() => {
        "xtypeobj": xtypeobj,
        "xnote": xnote,
        "xstatusreq": xstatusreq,
        "xqotnum": xqotnum,
        "xporeqnum": xporeqnum,
        "xdate": xdate.toJson(),
        "xregi": xregi,
        "xtwh": xtwh,
        "comp": comp,
        "preparer": preparer,
        "designation": designation,
        "deptname": deptname,
        "signname": signname,
        "signdesignation": signdesignation,
        "signdeptname": signdeptname,
      };
}

class Xdate {
  Xdate({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Xdate.fromJson(Map<String, dynamic> json) => Xdate(
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
