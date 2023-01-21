// To parse this JSON data, do
//
//     final lateNotificaitonApiModel = lateNotificaitonApiModelFromJson(jsonString);

import 'dart:convert';

List<LateNotificaitonApiModel> lateNotificaitonApiModelFromJson(String str) => List<LateNotificaitonApiModel>.from(json.decode(str).map((x) => LateNotificaitonApiModel.fromJson(x)));

String lateNotificaitonApiModelToJson(List<LateNotificaitonApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LateNotificaitonApiModel {
  LateNotificaitonApiModel({
    required this.xposition,
    required this.name,
    required this.designation,
    required this.intime,
    required this.xworktime,
    required this.empty,
    required this.xstatuslate,
    required this.xnote,
    required this.xyearperdate,
  });

  String xposition;
  String name;
  String designation;
  Time intime;
  Time xworktime;
  String empty;
  String xstatuslate;
  int xyearperdate;
  dynamic xnote;

  factory LateNotificaitonApiModel.fromJson(Map<String, dynamic> json) => LateNotificaitonApiModel(
    xposition: json["xposition"],
    name: json["name"],
    designation: json["designation"],
    intime: Time.fromJson(json["intime"]),
    xworktime: Time.fromJson(json["xworktime"]),
    empty: json[""],
    xstatuslate: json["xstatuslate"],
    xnote: json["xnote"],
    xyearperdate: json["xyearperdate"]
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
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "timezone_type": timezoneType,
    "timezone": timezone,
  };
}
