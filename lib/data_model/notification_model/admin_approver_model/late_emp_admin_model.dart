// To parse this JSON data, do
//
//     final lateNotiModel = lateNotiModelFromJson(jsonString);

import 'dart:convert';

List<LateNotiModel> lateNotiModelFromJson(String str) => List<LateNotiModel>.from(json.decode(str).map((x) => LateNotiModel.fromJson(x)));

String lateNotiModelToJson(List<LateNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LateNotiModel {
  LateNotiModel({
    required this.xposition,
    required this.name,
    required this.designation,
    required this.intime,
    required this.xworktime,
    required this.empty,
    required this.xstatuslate,
    required this.xnote,
    required this.xyearperdate,
    required this.xstaff,
  });

  String xposition;
  String name;
  dynamic designation;
  Time intime;
  Time xworktime;
  dynamic empty;
  dynamic xstatuslate;
  dynamic xnote;
  int xyearperdate;
  String xstaff;

  factory LateNotiModel.fromJson(Map<String, dynamic> json) => LateNotiModel(
    xposition: json["xposition"],
    name: json["name"],
    designation: json["designation"],
    intime: Time.fromJson(json["intime"]),
    xworktime: Time.fromJson(json["xworktime"]),
    empty: json[""],
    xstatuslate: json["xstatuslate"],
    xnote: json["xnote"],
    xyearperdate: json["xyearperdate"],
    xstaff: json["xstaff"],
  );

  Map<String, dynamic> toJson() => {
    "xposition": xposition,
    "name": name,
    "designation": designation,
    "intime": intime.toJson(),
    "xworktime": xworktime.toJson(),
    "": empty,
    "xstatuslate": xstatuslate,
    "xnote": xnote,
    "xyearperdate": xyearperdate,
    "xstaff": xstaff,
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
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "timezone_type": timezoneType,
    "timezone": timezone,
  };
}
