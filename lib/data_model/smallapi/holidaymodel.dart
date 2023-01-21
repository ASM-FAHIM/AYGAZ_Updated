// To parse this JSON data, do
//
//     final holidayModel = holidayModelFromJson(jsonString);

import 'dart:convert';

HolidayModel holidayModelFromJson(String str) => HolidayModel.fromJson(json.decode(str));

String holidayModelToJson(HolidayModel data) => json.encode(data.toJson());

class HolidayModel {
  HolidayModel({
    required this.holiday,
  });

  int holiday;

  factory HolidayModel.fromJson(Map<String, dynamic> json) => HolidayModel(
    holiday: json["holiday"],
  );

  Map<String, dynamic> toJson() => {
    "holiday": holiday,
  };
}
