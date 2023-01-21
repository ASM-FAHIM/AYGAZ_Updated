// To parse this JSON data, do
//
//     final absentNotificationModel = absentNotificationModelFromJson(jsonString);

import 'dart:convert';

List<AbsentNotificationModel> absentNotificationModelFromJson(String str) => List<AbsentNotificationModel>.from(json.decode(str).map((x) => AbsentNotificationModel.fromJson(x)));

String absentNotificationModelToJson(List<AbsentNotificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AbsentNotificationModel {
  AbsentNotificationModel({
    required this.xdate,
    required this.xdayname,
    required this.xshift,
    required this.xtimein,
    required this.xtimeout,
    required this.xstatus,
    required this.xstatusabsent,
  });

  Xdate xdate;
  String xdayname;
  dynamic xshift;
  dynamic xtimein;
  dynamic xtimeout;
  dynamic xstatus;
  dynamic xstatusabsent;

  factory AbsentNotificationModel.fromJson(Map<String, dynamic> json) => AbsentNotificationModel(
    xdate: Xdate.fromJson(json["xdate"]),
    xdayname: json["xdayname"],
    xshift: json["xshift"],
    xtimein: json["xtimein"],
    xtimeout: json["xtimeout"],
    xstatus: json["xstatus"],
    xstatusabsent: json["xstatusabsent"],
  );

  Map<String, dynamic> toJson() => {
    "xdate": xdate.toJson(),
    "xdayname": xdayname,
    "xshift": xshift,
    "xtimein": xtimein,
    "xtimeout": xtimeout,
    "xstatus": xstatus,
    "xstatusabsent": xstatusabsent,
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
