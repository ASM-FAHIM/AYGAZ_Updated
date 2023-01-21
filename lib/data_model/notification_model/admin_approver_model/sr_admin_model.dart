// To parse this JSON data, do
//
//     final srNotiModel = srNotiModelFromJson(jsonString);

import 'dart:convert';

List<SrNotiModel> srNotiModelFromJson(String str) => List<SrNotiModel>.from(
    json.decode(str).map((x) => SrNotiModel.fromJson(x)));

String srNotiModelToJson(List<SrNotiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SrNotiModel {
  SrNotiModel({
    required this.xtornum,
    required this.xdate,
    required this.xdatereq,
    required this.xfwh,
    required this.xfbrname,
    required this.xref,
    required this.xproject,
    required this.xprojectdec,
    required this.xregi,
    required this.xshift,
    required this.xstatustor,
    required this.xlong,
    required this.xnote,
    required this.preparer,
    required this.designation,
    required this.deptname,
    required this.signname,
    required this.signdesignation,
    required this.signdeptname,
  });

  dynamic xtornum;
  Xdate xdate;
  Xdate xdatereq;
  dynamic xfwh;
  dynamic xfbrname;
  dynamic xref;
  dynamic xproject;
  dynamic xprojectdec;
  dynamic xregi;
  dynamic xshift;
  dynamic xstatustor;
  dynamic xlong;
  dynamic xnote;
  dynamic preparer;
  dynamic designation;
  dynamic deptname;
  dynamic signname;
  dynamic signdesignation;
  dynamic signdeptname;

  factory SrNotiModel.fromJson(Map<String, dynamic> json) => SrNotiModel(
        xtornum: json["xtornum"],
        xdate: Xdate.fromJson(json["xdate"]),
        xdatereq: Xdate.fromJson(json["xdatereq"]),
        xfwh: json["xfwh"],
        xfbrname: json["xfbrname"],
        xref: json["xref"],
        xproject: json["xproject"],
        xprojectdec: json["xprojectdec"],
        xregi: json["xregi"],
        xshift: json["xshift"],
        xstatustor: json["xstatustor"],
        xlong: json["xlong"],
        xnote: json["xnote"],
        preparer: json["preparer"],
        designation: json["designation"],
        deptname: json["deptname"],
        signname: json["signname"],
        signdesignation: json["signdesignation"],
        signdeptname: json["signdeptname"],
      );

  Map<String, dynamic> toJson() => {
        "xtornum": xtornum,
        "xdate": xdate.toJson(),
        "xdatereq": xdatereq.toJson(),
        "xfwh": xfwh,
        "xfbrname": xfbrname,
        "xref": xref,
        "xproject": xproject,
        "xprojectdec": xprojectdec,
        "xregi": xregi,
        "xshift": xshift,
        "xstatustor": xstatustor,
        "xlong": xlong,
        "xnote": xnote,
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
