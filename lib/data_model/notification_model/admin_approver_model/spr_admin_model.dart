// To parse this JSON data, do
//
//     final sprModel = sprModelFromJson(jsonString);

import 'dart:convert';

List<SprModel> sprModelFromJson(String str) =>
    List<SprModel>.from(json.decode(str).map((x) => SprModel.fromJson(x)));

String sprModelToJson(List<SprModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SprModel {
  SprModel({
    required this.preparer,
    required this.designation,
    required this.deptname,
    required this.signname,
    required this.signdesignation,
    required this.signdeptname,
    required this.xnote,
    required this.xreqtype,
    required this.xshift,
    required this.xappnote,
    required this.xtypeobj,
    required this.xlong,
    required this.xempunit,
    required this.xregi,
    required this.xstatustor,
    required this.xtornum,
    required this.xdate,
    required this.xtitem,
    required this.xdatereq,
    required this.xfwh,
    required this.xfbrname,
    required this.xref,
    required this.twhdesc,
  });

  dynamic preparer;
  dynamic designation;
  dynamic deptname;
  dynamic signname;
  dynamic signdesignation;
  dynamic signdeptname;
  dynamic xnote;
  dynamic xreqtype;
  dynamic xshift;
  dynamic xappnote;
  dynamic xtypeobj;
  dynamic xlong;
  dynamic xempunit;
  dynamic xregi;
  dynamic xstatustor;
  dynamic xtornum;
  Xdate xdate;
  dynamic xtitem;
  Xdate xdatereq;
  dynamic xfwh;
  dynamic xfbrname;
  dynamic xref;
  dynamic twhdesc;

  factory SprModel.fromJson(Map<String, dynamic> json) => SprModel(
        preparer: json["preparer"],
        designation: json["designation"],
        deptname: json["deptname"],
        signname: json["signname"],
        signdesignation: json["signdesignation"],
        signdeptname: json["signdeptname"],
        xnote: json["xnote"],
        xreqtype: json["xreqtype"],
        xshift: json["xshift"],
        xappnote: json["xappnote"],
        xtypeobj: json["xtypeobj"],
        xlong: json["xlong"],
        xempunit: json["xempunit"],
        xregi: json["xregi"],
        xstatustor: json["xstatustor"],
        xtornum: json["xtornum"],
        xdate: Xdate.fromJson(json["xdate"]),
        xtitem: json["xtitem"],
        xdatereq: Xdate.fromJson(json["xdatereq"]),
        xfwh: json["xfwh"],
        xfbrname: json["xfbrname"],
        xref: json["xref"],
        twhdesc: json["twhdesc"],
      );

  Map<String, dynamic> toJson() => {
        "preparer": preparer,
        "designation": designation,
        "deptname": deptname,
        "signname": signname,
        "signdesignation": signdesignation,
        "signdeptname": signdeptname,
        "xnote": xnote,
        "xreqtype": xreqtype,
        "xshift": xshift,
        "xappnote": xappnote,
        "xtypeobj": xtypeobj,
        "xlong": xlong,
        "xempunit": xempunit,
        "xregi": xregi,
        "xstatustor": xstatustor,
        "xtornum": xtornum,
        "xdate": xdate.toJson(),
        "xtitem": xtitem,
        "xdatereq": xdatereq.toJson(),
        "xfwh": xfwh,
        "xfbrname": xfbrname,
        "xref": xref,
        "twhdesc": twhdesc,
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
