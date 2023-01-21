// To parse this JSON data, do
//
//     final leaveTypeModel = leaveTypeModelFromJson(jsonString);

import 'dart:convert';

List<LeaveTypeModel> leaveTypeModelFromJson(String str) =>
    List<LeaveTypeModel>.from(
        json.decode(str).map((x) => LeaveTypeModel.fromJson(x)));

String leaveTypeModelToJson(List<LeaveTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveTypeModel {
  LeaveTypeModel({
    required this.xtypeleave,
  });

  String xtypeleave;

  factory LeaveTypeModel.fromJson(Map<String, dynamic> json) => LeaveTypeModel(
        xtypeleave: json["xtypeleave"],
      );

  Map<String, dynamic> toJson() => {
        "xtypeleave": xtypeleave,
      };
}
