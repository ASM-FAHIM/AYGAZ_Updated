// To parse this JSON data, do
//
//     final checkLeaveBalance = checkLeaveBalanceFromJson(jsonString);

import 'dart:convert';

CheckLeaveBalance checkLeaveBalanceFromJson(String str) =>
    CheckLeaveBalance.fromJson(json.decode(str));

String checkLeaveBalanceToJson(CheckLeaveBalance data) =>
    json.encode(data.toJson());

class CheckLeaveBalance {
  CheckLeaveBalance({
    required this.xbalance,
  });

  String xbalance;

  factory CheckLeaveBalance.fromJson(Map<String, dynamic> json) =>
      CheckLeaveBalance(
        xbalance: json["xbalance"],
      );

  Map<String, dynamic> toJson() => {
        "xbalance": xbalance,
      };
}
