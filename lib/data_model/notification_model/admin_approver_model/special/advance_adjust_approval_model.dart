// To parse this JSON data, do
//
//     final advanceAdjustNotiModel = advanceAdjustNotiModelFromJson(jsonString);

import 'dart:convert';

List<AdvanceAdjustNotiModel> advanceAdjustNotiModelFromJson(String str) => List<AdvanceAdjustNotiModel>.from(json.decode(str).map((x) => AdvanceAdjustNotiModel.fromJson(x)));

String advanceAdjustNotiModelToJson(List<AdvanceAdjustNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvanceAdjustNotiModel {
  AdvanceAdjustNotiModel({
    required this.qeqnum,
    required this.zid,
    required this.xdate,
    required this.xstatus,
    required this.xadvnum,
    required this.unitName,
    required this.xnote,
    required this.xstaff,
    required this.name,
    required this.xadjamt,
  });

  dynamic qeqnum;
  int zid;
  Xdate xdate;
  dynamic xstatus;
  dynamic xadvnum;
  dynamic unitName;
  dynamic xnote;
  dynamic xstaff;
  dynamic name;
  dynamic xadjamt;

  factory AdvanceAdjustNotiModel.fromJson(Map<String, dynamic> json) => AdvanceAdjustNotiModel(
    qeqnum: json["qeqnum"],
    zid: json["zid"],
    xdate: Xdate.fromJson(json["xdate"]),
    xstatus: json["xstatus"],
    xadvnum: json["xadvnum"],
    unitName: json["unit_name"],
    xnote: json["xnote"],
    xstaff: json["xstaff"],
    name: json["name"],
    xadjamt: json["xadjamt"]
  );

  Map<String, dynamic> toJson() => {
    "qeqnum": qeqnum,
    "zid": zid,
    "xdate": xdate.toJson(),
    "xstatus": xstatus,
    "xadvnum": xadvnum,
    "unit_name": unitName,
    "xnote": xnote,
    "xstaff": xstaff,
    "name": name,
    "xadjamt": xadjamt
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
