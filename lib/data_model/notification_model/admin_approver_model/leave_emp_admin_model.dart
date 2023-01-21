// To parse this JSON data, do
//
//     final leaveandTourempNotiModel = leaveandTourempNotiModelFromJson(jsonString);

import 'dart:convert';

List<LeaveandTourempNotiModel> leaveandTourempNotiModelFromJson(String str) => List<LeaveandTourempNotiModel>.from(json.decode(str).map((x) => LeaveandTourempNotiModel.fromJson(x)));

String leaveandTourempNotiModelToJson(List<LeaveandTourempNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveandTourempNotiModel {
  LeaveandTourempNotiModel({
    required this.xstaff,
    required this.xname,
    required this.designation,
    required this.xdate,
    required this.xtypeleave,
    required this.xdatefrom,
    required this.xdateto,
    required this.xappday,
    required this.xday,
    required this.xstatus,
    required this.xnote,
    required this.xyearperdate,
    required this.xyear,
  });

  String xstaff;
  String xname;
  dynamic designation;
  Xdate xdate;
  String xtypeleave;
  Xdate xdatefrom;
  Xdate xdateto;
  int xappday;
  String xday;
  String xstatus;
  dynamic xnote;
  int xyearperdate;
  int xyear;

  factory LeaveandTourempNotiModel.fromJson(Map<String, dynamic> json) => LeaveandTourempNotiModel(
    xstaff: json["xstaff"],
    xname: json["xname"],
    designation: json["designation"],
    xdate: Xdate.fromJson(json["xdate"]),
    xtypeleave: json["xtypeleave"],
    xdatefrom: Xdate.fromJson(json["xdatefrom"]),
    xdateto: Xdate.fromJson(json["xdateto"]),
    xappday: json["xappday"],
    xday: json["xday"],
    xstatus: json["xstatus"],
    xnote: json["xnote"],
    xyearperdate: json["xyearperdate"],
    xyear: json["xyear"]
  );

  Map<String, dynamic> toJson() => {
    "xstaff": xstaff,
    "xname": xname,
    "designation": designation,
    "xdate": xdate.toJson(),
    "xtypeleave": xtypeleave,
    "xdatefrom": xdatefrom.toJson(),
    "xdateto": xdateto.toJson(),
    "xappday": xappday,
    "xday": xday,
    "xstatus": xstatus,
    "xnote": xnote,
    "xyearperdate": xyearperdate,
    "xyear": xyear
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
