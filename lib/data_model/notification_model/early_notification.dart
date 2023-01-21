// To parse this JSON data, do
//
//     final earlyNotificaitonApiModel = earlyNotificaitonApiModelFromJson(jsonString);

import 'dart:convert';

List<EarlyNotificaitonApiModel> earlyNotificaitonApiModelFromJson(String str) => List<EarlyNotificaitonApiModel>.from(json.decode(str).map((x) => EarlyNotificaitonApiModel.fromJson(x)));

String earlyNotificaitonApiModelToJson(List<EarlyNotificaitonApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EarlyNotificaitonApiModel {
  EarlyNotificaitonApiModel({
    required this.xposition,
    required this.name,
    required this.designation,
    required this.intime,
    required this.xworktime,
    required this.empty,
    required this.xstatusel,
    required this.xnote,
    required this.xyearperdate,
  });

  String xposition;
  String name;
  String designation;
  Time intime;
  Time xworktime;
  String empty;
  String xstatusel;
  dynamic xnote;
  int xyearperdate;

  factory EarlyNotificaitonApiModel.fromJson(Map<String, dynamic> json) => EarlyNotificaitonApiModel(
    xposition: json["xposition"],
    name: json["name"],
    designation: json["designation"],
    intime: Time.fromJson(json["intime"]),
    xworktime: Time.fromJson(json["xworktime"]),
    empty: json[""],
    xstatusel: json["xstatusel"],
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
    "xstatusel": xstatusel,
    "xnote": xnote,
    "xyearperdate": xyearperdate,
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
