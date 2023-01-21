// To parse this JSON data, do
//
//     final absentempNotiModel = absentempNotiModelFromJson(jsonString);

import 'dart:convert';

List<AbsentempNotiModel> absentempNotiModelFromJson(String str) => List<AbsentempNotiModel>.from(json.decode(str).map((x) => AbsentempNotiModel.fromJson(x)));

String absentempNotiModelToJson(List<AbsentempNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AbsentempNotiModel {
  AbsentempNotiModel({
    required this.name,
    required this.designation,
    required this.intime,
    required this.outtime,
    required this.xworktime,
    required this.xstatus,
    required this.xnote,
    required this.xstaff,
    required this.xyearperdate,
  });

  String name;
  String designation;
  Time intime;
  Time outtime;
  Time xworktime;
  String xstatus;
  dynamic xnote;
  String xstaff;
  int xyearperdate;

  factory AbsentempNotiModel.fromJson(Map<String, dynamic> json) => AbsentempNotiModel(
    name: json["name"],
    designation: json["designation"],
    intime: Time.fromJson(json["intime"]),
    outtime: Time.fromJson(json["outtime"]),
    xworktime: Time.fromJson(json["xworktime"]),
    xstatus: json["xstatus"],
    xnote: json["xnote"],
    xstaff: json["xstaff"],
    xyearperdate: json["xyearperdate"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "designation": designation,
    "intime": intime.toJson(),
    "outtime": outtime.toJson(),
    "xworktime": xworktime.toJson(),
    "xstatus": xstatus,
    "xnote": xnote,
    "xstaff": xstaff,
    "xyearperdate": xyearperdate
  };
}

class Time {
  Time({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    date: DateTime.parse(json["date"]),
    timezoneType: json["timezone_type"],
    timezone: "timezone",
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "timezone_type": timezoneType,
    "timezone": timezone,
  };
}
