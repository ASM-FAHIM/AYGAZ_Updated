// To parse this JSON data, do
//
//     final soModel = soModelFromJson(jsonString);

import 'dart:convert';

List<SoModel> soModelFromJson(String str) =>
    List<SoModel>.from(json.decode(str).map((x) => SoModel.fromJson(x)));

String soModelToJson(List<SoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SoModel {
  SoModel({
    required this.xtotamt,
    required this.xnote1,
    required this.xlong,
    required this.xterritory,
    required this.xtso,
    required this.xtsoname,
    required this.xstatustor,
    required this.xref,
    required this.cusname,
    required this.xtbrname,
    required this.xsubcat,
    required this.xwh,
    required this.xfwh,
    required this.xfproject,
    required this.xdatedel,
    required this.xdate,
    required this.xtornum,
    required this.fwhdesc,
    required this.preparer,
    required this.designation,
    required this.deptname,
    required this.signname,
    required this.signdesignation,
    required this.signdeptname,
  });

  dynamic xtotamt;
  dynamic xnote1;
  dynamic xlong;
  dynamic xterritory;
  dynamic xtso;
  dynamic xtsoname;
  dynamic xstatustor;
  dynamic xref;
  dynamic cusname;
  dynamic xtbrname;
  dynamic xsubcat;
  dynamic xwh;
  dynamic xfwh;
  dynamic xfproject;
  Xdate xdatedel;
  Xdate xdate;
  dynamic xtornum;
  dynamic fwhdesc;
  dynamic preparer;
  dynamic designation;
  dynamic deptname;
  dynamic signname;
  dynamic signdesignation;
  dynamic signdeptname;

  factory SoModel.fromJson(Map<String, dynamic> json) => SoModel(
        xtotamt: json["xtotamt"],
        xnote1: json["xnote1"] == null ? null : json["xnote1"],
        xlong: json["xlong"],
        xterritory: json["xterritory"],
        xtso: json["xtso"],
        xtsoname: json["xtsoname"],
        xstatustor: json["xstatustor"],
        xref: json["xref"],
        cusname: json["cusname"],
        xtbrname: json["xtbrname"],
        xsubcat: json["xsubcat"],
        xwh: json["xwh"],
        xfwh: json["xfwh"],
        xfproject: json["xfproject"],
        xdatedel: Xdate.fromJson(json["xdatedel"]),
        xdate: Xdate.fromJson(json["xdate"]),
        xtornum: json["xtornum"],
        fwhdesc: json["fwhdesc"],
        preparer: json["preparer"],
        designation: json["designation"],
        deptname: json["deptname"],
        signname: json["signname"],
        signdesignation: json["signdesignation"],
        signdeptname: json["signdeptname"],
      );

  Map<String, dynamic> toJson() => {
        "xtotamt": xtotamt,
        "xnote1": xnote1 == null ? null : xnote1,
        "xlong": xlong,
        "xterritory": xterritory,
        "xtso": xtso,
        "xtsoname": xtsoname,
        "xstatustor": xstatustor,
        "xref": xref,
        "cusname": cusname,
        "xtbrname": xtbrname,
        "xsubcat": xsubcat,
        "xwh": xwh,
        "xfwh": xfwh,
        "xfproject": xfproject,
        "xdatedel": xdatedel.toJson(),
        "xdate": xdate.toJson(),
        "xtornum": xtornum,
        "fwhdesc": fwhdesc,
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
