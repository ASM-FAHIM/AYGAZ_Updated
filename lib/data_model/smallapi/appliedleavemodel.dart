// To parse this JSON data, do
//
//     final appliedLeaveModel = appliedLeaveModelFromJson(jsonString);

import 'dart:convert';

AppliedLeaveModel appliedLeaveModelFromJson(String str) => AppliedLeaveModel.fromJson(json.decode(str));

String appliedLeaveModelToJson(AppliedLeaveModel data) => json.encode(data.toJson());

class AppliedLeaveModel {
  AppliedLeaveModel({
    required this.appliedleave,
  });

  dynamic appliedleave;

  factory AppliedLeaveModel.fromJson(Map<String, dynamic> json) => AppliedLeaveModel(
    appliedleave: json["appliedleave"],
  );

  Map<String, dynamic> toJson() => {
    "appliedleave": appliedleave,
  };
}
