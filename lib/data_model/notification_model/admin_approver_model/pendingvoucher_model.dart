// To parse this JSON data, do
//
//     final pendingvoucherModel = pendingvoucherModelFromJson(jsonString);

import 'dart:convert';

List<PendingvoucherModel> pendingvoucherModelFromJson(String str) =>
    List<PendingvoucherModel>.from(
        json.decode(str).map((x) => PendingvoucherModel.fromJson(x)));

String pendingvoucherModelToJson(List<PendingvoucherModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingvoucherModel {
  PendingvoucherModel({
    required this.xdate,
    required this.xlong,
    required this.xvoucher,
    required this.xtrn,
    required this.xref,
    required this.xlcno,
    required this.xwh,
    required this.xwhdec,
    required this.xchequeno,
    required this.xdatechq,
    required this.xbank,
    required this.bname,
    required this.xyear,
    required this.xper,
    required this.xstatus,
    required this.xstatusjv,
    required this.xnote,
    required this.preparer,
    required this.designation,
    required this.deptname,
    required this.signname,
    required this.signdesignation,
    required this.signdeptname,
  });

  Xdate xdate;
  dynamic xlong;
  dynamic xvoucher;
  dynamic xtrn;
  dynamic xref;
  dynamic xlcno;
  dynamic xwh;
  dynamic xwhdec;
  dynamic xchequeno;
  dynamic xdatechq;
  dynamic xbank;
  dynamic bname;
  int xyear;
  int xper;
  dynamic xstatus;
  dynamic xstatusjv;
  dynamic xnote;
  dynamic preparer;
  dynamic designation;
  dynamic deptname;
  dynamic signname;
  dynamic signdesignation;
  dynamic signdeptname;

  factory PendingvoucherModel.fromJson(Map<String, dynamic> json) =>
      PendingvoucherModel(
        xdate: Xdate.fromJson(json["xdate"]),
        xlong: json["xlong"],
        xvoucher: json["xvoucher"],
        xtrn: json["xtrn"],
        xref: json["xref"],
        xlcno: json["xlcno"],
        xwh: json["xwh"],
        xwhdec: json["xwhdec"],
        xchequeno: json["xchequeno"],
        xdatechq: json["xdatechq"],
        xbank: json["xbank"],
        bname: json["bname"],
        xyear: json["xyear"],
        xper: json["xper"],
        xstatus: json["xstatus"],
        xstatusjv: json["xstatusjv"],
        xnote: json["xnote"],
        preparer: json["preparer"],
        designation: json["designation"],
        deptname: json["deptname"],
        signname: json["signname"],
        signdesignation: json["signdesignation"],
        signdeptname: json["signdeptname"],
      );

  Map<String, dynamic> toJson() => {
        "xdate": xdate.toJson(),
        "xlong": xlong,
        "xvoucher": xvoucher,
        "xtrn": xtrn,
        "xref": xref,
        "xlcno": xlcno,
        "xwh": xwh,
        "xwhdec": xwhdec,
        "xchequeno": xchequeno,
        "xdatechq": xdatechq,
        "xbank": xbank,
        "bname": bname,
        "xyear": xyear,
        "xper": xper,
        "xstatus": xstatus,
        "xstatusjv": xstatusjv,
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
