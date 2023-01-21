// To parse this JSON data, do
//
//     final sqcModel = sqcModelFromJson(jsonString);

import 'dart:convert';

List<SqcModel> sqcModelFromJson(String str) =>
    List<SqcModel>.from(json.decode(str).map((x) => SqcModel.fromJson(x)));

String sqcModelToJson(List<SqcModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SqcModel {
  SqcModel({
    required this.xcur,
    required this.povalue,
    required this.xnote,
    required this.xnote1,
    required this.deptname,
    required this.signname,
    required this.signdesignation,
    required this.preparer,
    required this.designation,
    required this.signdeptname,
    required this.xpornum,
    required this.xlcno,
    required this.xref,
    required this.xstatusgrn,
    required this.xorg,
    required this.xcus,
    required this.xinvnum,
    required this.xgrnnum,
    required this.xstatusdoc,
    required this.xdate,
    required this.sup,
    required this.xwh,
    required this.xwhdesc,
  });

  dynamic xcur;
  dynamic povalue;
  dynamic xnote;
  dynamic xnote1;
  dynamic deptname;
  dynamic signname;
  dynamic signdesignation;
  dynamic preparer;
  dynamic designation;
  dynamic signdeptname;
  dynamic xpornum;
  dynamic xlcno;
  dynamic xref;
  dynamic xstatusgrn;
  dynamic xorg;
  dynamic xcus;
  dynamic xinvnum;
  dynamic xgrnnum;
  dynamic xstatusdoc;
  Xdate xdate;
  dynamic sup;
  dynamic xwh;
  dynamic xwhdesc;

  factory SqcModel.fromJson(Map<String, dynamic> json) => SqcModel(
        xcur: json["xcur"],
        povalue: json["povalue"],
        xnote: json["xnote"],
        xnote1: json["xnote1"],
        deptname: json["deptname"],
        signname: json["signname"],
        signdesignation: json["signdesignation"],
        preparer: json["preparer"],
        designation: json["designation"],
        signdeptname: json["signdeptname"],
        xpornum: json["xpornum"],
        xlcno: json["xlcno"],
        xref: json["xref"],
        xstatusgrn: json["xstatusgrn"],
        xorg: json["xorg"],
        xcus: json["xcus"],
        xinvnum: json["xinvnum"],
        xgrnnum: json["xgrnnum"],
        xstatusdoc: json["xstatusdoc"],
        xdate: Xdate.fromJson(json["xdate"]),
        sup: json["sup"],
        xwh: json["xwh"],
        xwhdesc: json["xwhdesc"],
      );

  Map<String, dynamic> toJson() => {
        "xcur": xcur,
        "povalue": povalue,
        "xnote": xnote,
        "xnote1": xnote1,
        "deptname": deptname,
        "signname": signname,
        "signdesignation": signdesignation,
        "preparer": preparer,
        "designation": designation,
        "signdeptname": signdeptname,
        "xpornum": xpornum,
        "xlcno": xlcno,
        "xref": xref,
        "xstatusgrn": xstatusgrn,
        "xorg": xorg,
        "xcus": xcus,
        "xinvnum": xinvnum,
        "xgrnnum": xgrnnum,
        "xstatusdoc": xstatusdoc,
        "xdate": xdate.toJson(),
        "sup": sup,
        "xwh": xwh,
        "xwhdesc": xwhdesc,
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
