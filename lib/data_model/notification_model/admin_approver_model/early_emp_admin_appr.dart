// // To parse this JSON data, do
// //
// //     final attendenceReportModel = attendenceReportModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<AttendenceReportModel> attendenceReportModelFromJson(String str) => List<AttendenceReportModel>.from(json.decode(str).map((x) => AttendenceReportModel.fromJson(x)));
//
// String attendenceReportModelToJson(List<AttendenceReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class AttendenceReportModel {
//   AttendenceReportModel({
//     required required this.xposition,
//     required required this.name,
//     required required this.designation,
//     required required this.intime,
//     required required this.xworktime,
//     required required this.empty,
//     required required this.xstatusel,
//     required required this.xnote,
//   });
//
//   String xposition;
//   String name;
//   String designation;
//   Time intime;
//   Time xworktime;
//   String empty;
//   String xstatusel;
//   dynamic xnote;
//
//   factory AttendenceReportModel.fromJson(Map<String, dynamic> json) => AttendenceReportModel(
//     xposition: json["xposition"],
//     name: json["name"],
//     designation: json["designation"],
//     intime: Time.fromJson(json["intime"]),
//     xworktime: Time.fromJson(json["xworktime"]),
//     empty: json[""],
//     xstatusel: json["xstatusel"],
//     xnote: json["xnote"] == null ? null : json["xnote"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "xposition": xposition,
//     "name": name,
//     "designation": designation,
//     "intime": intime.toJson(),
//     "xworktime": xworktime.toJson(),
//     "": empty,
//     "xstatusel": xstatusel,
//     "xnote": xnote == null ? null : xnote,
//   };
// }
//
// class Time {
//   Time({
//     required required this.date,
//     required required this.timezoneType,
//     required required this.timezone,
//   });
//
//   DateTime date;
//   int timezoneType;
//   String timezone;
//
//   factory Time.fromJson(Map<String, dynamic> json) => Time(
//     date: DateTime.parse(json["date"]),
//     timezoneType: json["timezone_type"],
//     timezone: json["timezone"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "date": date.toIso8601String(),
//     "timezone_type": timezoneType,
//     "timezone": timezone,
//   };
// }
//


// To parse this JSON data, do
//
//     final adminearlyNotiModel = adminearlyNotiModelFromJson(jsonString);

import 'dart:convert';

List<AdminearlyNotiModel> adminearlyNotiModelFromJson(String str) => List<AdminearlyNotiModel>.from(json.decode(str).map((x) => AdminearlyNotiModel.fromJson(x)));

String adminearlyNotiModelToJson(List<AdminearlyNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminearlyNotiModel {
  AdminearlyNotiModel({
    required this.xposition,
    required this.name,
    required this.designation,
    required this.xtimein,
    required this.xtimeout1,
    required this.xworktime,
    required this.empty,
    required this.xstatusel,
    required this.xstaff,
    required this.xyearperdate,
    required this.xnote,
  });

  String xposition;
  String name;
  dynamic designation;
  Xtimein xtimein;
  Xtimein xtimeout1;
  Xtimein xworktime;
  dynamic empty;
  dynamic xstatusel;
  String xstaff;
  int xyearperdate;
  dynamic xnote;

  factory AdminearlyNotiModel.fromJson(Map<String, dynamic> json) => AdminearlyNotiModel(
    xposition: json["xposition"],
    name: json["name"],
    designation: json["designation"],
    xtimein: Xtimein.fromJson(json["xtimein"]),
    xtimeout1: Xtimein.fromJson(json["xtimeout1"]),
    xworktime: Xtimein.fromJson(json["xworktime"]),
    empty: json[""],
    xstatusel: json["xstatusel"],
    xnote: json["xnote"] == null ? null : json["xnote"],
    xyearperdate: json["xyearperdate"],
    xstaff: json["xstaff"],
  );

  Map<String, dynamic> toJson() => {
    "xposition": xposition,
    "name": name,
    "designation": designation,
    "xtimein": xtimein.toJson(),
    "xtimeout1": xtimeout1.toJson(),
    "xworktime": xworktime.toJson(),
    "": empty,
    "xstatusel": xstatusel,
    "xyearperdate":xyearperdate,
    "xstaff": xstaff,
    "xnote": xnote == null ? null : xnote,

  };
}

class Xtimein {
  Xtimein({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Xtimein.fromJson(Map<String, dynamic> json) => Xtimein(
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

