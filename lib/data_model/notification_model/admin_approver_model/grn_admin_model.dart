// To parse this JSON data, do
//
//     final grnModel = grnModelFromJson(jsonString);

import 'dart:convert';

List<GrnModel> grnModelFromJson(String str) =>
    List<GrnModel>.from(json.decode(str).map((x) => GrnModel.fromJson(x)));

String grnModelToJson(List<GrnModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GrnModel {
  GrnModel({
    required this.xstatusdoc,
    required this.xinvnum,
    required this.xcus,
    required this.xnote,
    required this.xstatusgrn,
    required this.xorg,
    required this.xref,
    required this.xtypeobj,
    required this.xstatusreq,
    required this.xgrnnum,
    required this.xdate,
    required this.xregi,
    required this.xlcno,
    required this.sup,
    required this.xwhdesc,
    required this.xwh,
    required this.preparer,
    required this.designation,
    required this.deptname,
    required this.signname,
    required this.signdesignation,
    required this.signdeptname,
  });

  dynamic xstatusdoc;
  dynamic xinvnum;
  dynamic xcus;
  dynamic xnote;
  dynamic xstatusgrn;
  dynamic xorg;
  dynamic xref;
  dynamic xtypeobj;
  dynamic xstatusreq;
  dynamic xgrnnum;
  Xdate xdate;
  dynamic xregi;
  dynamic xlcno;
  dynamic sup;
  dynamic xwhdesc;
  dynamic xwh;
  dynamic preparer;
  dynamic designation;
  dynamic deptname;
  dynamic signname;
  dynamic signdesignation;
  dynamic signdeptname;

  factory GrnModel.fromJson(Map<String, dynamic> json) => GrnModel(
        xstatusdoc: json["xstatusdoc"],
        xinvnum: json["xinvnum"],
        xcus: json["xcus"],
        xnote: json["xnote"],
        xstatusgrn: json["xstatusgrn"],
        xorg: json["xorg"],
        xref: json["xref"],
        xtypeobj: json["xtypeobj"],
        xstatusreq: json["xstatusreq"],
        xgrnnum: json["xgrnnum"],
        xdate: Xdate.fromJson(json["xdate"]),
        xregi: json["xregi"],
        xlcno: json["xlcno"],
        sup: json["sup"],
        xwhdesc: json["xwhdesc"],
        xwh: json["xwh"],
        preparer: json["preparer"],
        designation: json["designation"],
        deptname: json["deptname"],
        signname: json["signname"],
        signdesignation: json["signdesignation"],
        signdeptname: json["signdeptname"],
      );

  Map<String, dynamic> toJson() => {
        "xstatusdoc": xstatusdoc,
        "xinvnum": xinvnum,
        "xcus": xcus,
        "xnote": xnote,
        "xstatusgrn": xstatusgrn,
        "xorg": xorg,
        "xref": xref,
        "xtypeobj": xtypeobj,
        "xstatusreq": xstatusreq,
        "xgrnnum": xgrnnum,
        "xdate": xdate.toJson(),
        "xregi": xregi,
        "xlcno": xlcno,
        "sup": sup,
        "xwhdesc": xwhdesc,
        "xwh": xwh,
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
