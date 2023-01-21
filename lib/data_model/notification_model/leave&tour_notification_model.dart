// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsondynamic);

import 'dart:convert';

List<LeaveTourNotificationModel> loginModelFromJson(dynamic str) => List<LeaveTourNotificationModel>.from(json.decode(str).map((x) => LeaveTourNotificationModel.fromJson(x)));

dynamic loginModelToJson(List<LeaveTourNotificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveTourNotificationModel {
  LeaveTourNotificationModel({
    required this.applyDate,
    required this.typeOfApplication,
    required this.fromDate,
    required this.toDate,
    required this.appliedDayS,
    required this.approvedDayS,
    required this.status,
    required this.approver,
    required this.approvedRecommendedBy,
    required this.approvedRecommendedDate,
    required this.approvedBy,
    required this.approvedDate,

  });

  Date applyDate;
  dynamic typeOfApplication;
  Date fromDate;
  Date toDate;
  int appliedDayS;
  dynamic approvedDayS;
  dynamic status;
  dynamic approver;
  dynamic approvedRecommendedBy;
  dynamic approvedRecommendedDate;
  dynamic approvedBy;
  dynamic approvedDate;


  factory LeaveTourNotificationModel.fromJson(Map<String, dynamic> json) => LeaveTourNotificationModel(
    applyDate: Date.fromJson(json["Apply Date"]),
    typeOfApplication: json["Type Of Application"],
    fromDate: Date.fromJson(json["From Date"]),
    toDate: Date.fromJson(json["To Date"]),
    appliedDayS: json["Applied Day(s)"],
    approvedDayS: json["Approved Day(s)"],
    status: json["Status"],
    approver: json["Approver"],
    approvedRecommendedBy: json["Approved/Recommended By"],
    approvedRecommendedDate: json["Approved/Recommended Date"],
    approvedBy: json["Approved By"],
    approvedDate: json["Approved Date"],

  );

  Map<String, dynamic> toJson() => {
    "Apply Date": applyDate.toJson(),
    "Type Of Application": typeOfApplication,
    "From Date": fromDate.toJson(),
    "To Date": toDate.toJson(),
    "Applied Day(s)": appliedDayS,
    "Approved Day(s)": approvedDayS,
    "Status": status,
    "Approver": approver,
    "Approved/Recommended By": approvedRecommendedBy,
    "Approved/Recommended Date": approvedRecommendedDate,
    "Approved By": approvedBy,
    "Approved Date": approvedDate,

  };
}

class Date {
  Date({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  dynamic timezone;

  factory Date.fromJson(Map<dynamic, dynamic> json) => Date(
    date: DateTime.parse(json["date"]),
    timezoneType: json["timezone_type"],
    timezone: json["timezone"],
  );

  Map<dynamic, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "timezone_type": timezoneType,
    "timezone": timezone,
  };
}
//
// enum Timezone { EUROPE_BERLIN }
//
// final timezoneValues = EnumValues({
//   "Europe/Berlin": Timezone.EUROPE_BERLIN
// });
//
// enum Status { APPLIED, CONFIRMED, REJECTED }
//
// final statusValues = EnumValues({
//   "Applied": Status.APPLIED,
//   "Confirmed": Status.CONFIRMED,
//   "Rejected": Status.REJECTED
// });
//
// class EnumValues<T> {
//   Map<dynamic, T> map;
//   Map<T, dynamic> reverseMap;
//
//   EnumValues(required this.map);
//
//   Map<T, dynamic> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
