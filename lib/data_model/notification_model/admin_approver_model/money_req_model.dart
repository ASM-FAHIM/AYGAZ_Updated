// To parse this JSON data, do
//
//     final moneyReqModel = moneyReqModelFromJson(jsonString);

import 'dart:convert';

List<MoneyReqModel> moneyReqModelFromJson(String str) => List<MoneyReqModel>.from(json.decode(str).map((x) => MoneyReqModel.fromJson(x)));

String moneyReqModelToJson(List<MoneyReqModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoneyReqModel {
  MoneyReqModel({
    required this.xacreqnum,
    required this.xdate,
    required this.xpreparer,
    required this.xpreparerName,
    required this.xprime,
    required this.xstatus,
    required this.xtypeobj,
    required this.xnote,
    required this.xnote1,
    this.xsignatory1Name,
    this.xsignatory2Name,
    this.xsignatory3Name,
  });

  String xacreqnum;
  Xdate xdate;
  String xpreparer;
  String xpreparerName;
  String xprime;
  String xstatus;
  String xtypeobj;
  String xnote;
  String xnote1;
  dynamic xsignatory1Name;
  dynamic xsignatory2Name;
  dynamic xsignatory3Name;

  factory MoneyReqModel.fromJson(Map<String, dynamic> json) => MoneyReqModel(
    xacreqnum: json["xacreqnum"],
    xdate: Xdate.fromJson(json["xdate"]),
    xpreparer: json["xpreparer"],
    xpreparerName: json["xpreparerName"],
    xprime: json["xprime"],
    xstatus: json["xstatus"],
    xtypeobj: json["xtypeobj"],
    xnote: json["xnote"],
    xnote1: json["xnote1"],
    xsignatory1Name: json["xsignatory1Name"],
    xsignatory2Name: json["xsignatory2Name"],
    xsignatory3Name: json["xsignatory3Name"],
  );

  Map<String, dynamic> toJson() => {
    "xacreqnum": xacreqnum,
    "xdate": xdate.toJson(),
    "xpreparer": xpreparer,
    "xpreparerName": xpreparerName,
    "xprime": xprime,
    "xstatus": xstatus,
    "xtypeobj": xtypeobj,
    "xnote": xnote,
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
