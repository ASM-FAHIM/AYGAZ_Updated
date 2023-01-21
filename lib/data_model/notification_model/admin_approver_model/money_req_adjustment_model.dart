// To parse this JSON data, do
//
//     final moneyReqAdjustModel = moneyReqAdjustModelFromJson(jsonString);

import 'dart:convert';

List<MoneyReqAdjustModel> moneyReqAdjustModelFromJson(String str) =>
    List<MoneyReqAdjustModel>.from(
        json.decode(str).map((x) => MoneyReqAdjustModel.fromJson(x)));

String moneyReqAdjustModelToJson(List<MoneyReqAdjustModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoneyReqAdjustModel {
  MoneyReqAdjustModel({
    required this.xacreqnum,
    required this.xdate,
    required this.xadvnum,
    required this.xadjamt,
    required this.xadjamtbal,
    required this.xprime,
    required this.xadvrem,
    required this.xnote,
    required this.xtypeobj,
    required this.xpreparer,
    required this.xpreparerName,
    required this.xstatus,
    required this.xnote1,
    required this.xsignatory1Name,
    required this.xsignatory2Name,
    required this.xsignatory3Name,
  });

  dynamic xacreqnum;
  dynamic xdate;
  dynamic xadvnum;
  dynamic xadjamt;
  dynamic xadjamtbal;
  dynamic xprime;
  dynamic xadvrem;
  dynamic xnote;
  dynamic xtypeobj;
  dynamic xpreparer;
  dynamic xpreparerName;
  dynamic xstatus;
  dynamic xnote1;
  dynamic xsignatory1Name;
  dynamic xsignatory2Name;
  dynamic xsignatory3Name;

  factory MoneyReqAdjustModel.fromJson(Map<String, dynamic> json) =>
      MoneyReqAdjustModel(
        xacreqnum: json["xacreqnum"],
        xdate: Xdate.fromJson(json["xdate"]),
        xadvnum: json["xadvnum"],
        xadjamt: json["xadjamt"],
        xadjamtbal: json["xadjamtbal"],
        xprime: json["xprime"],
        xadvrem: json["xadvrem"],
        xnote: json["xnote"],
        xtypeobj: json["xtypeobj"],
        xpreparer: json["xpreparer"],
        xpreparerName: json["xpreparerName"],
        xstatus: json["xstatus"],
        xnote1: json["xnote1"],
        xsignatory1Name: json["xsignatory1Name"],
        xsignatory2Name: json["xsignatory2Name"],
        xsignatory3Name: json["xsignatory3Name"],
      );

  Map<String, dynamic> toJson() => {
        "xacreqnum": xacreqnum,
        "xdate": xdate.toJson(),
        "xadvnum": xadvnum,
        "xadjamt": xadjamt,
        "xadjamtbal": xadjamtbal,
        "xprime": xprime,
        "xadvrem": xadvrem,
        "xnote": xnote,
        "xtypeobj": xtypeobj,
        "xpreparer": xpreparer,
        "xpreparerName": xpreparerName,
        "xstatus": xstatus,
        "xnote1": xnote1,
        "xsignatory1Name": xsignatory1Name,
        "xsignatory2Name": xsignatory2Name,
        "xsignatory3Name": xsignatory3Name,
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
