// To parse this JSON data, do
//
//     final availebleLeaveModel = availebleLeaveModelFromJson(jsonString);

import 'dart:convert';

List<AvailebleLeaveModel> availebleLeaveModelFromJson(String str) =>
    List<AvailebleLeaveModel>.from(
        json.decode(str).map((x) => AvailebleLeaveModel.fromJson(x)));

String availebleLeaveModelToJson(List<AvailebleLeaveModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvailebleLeaveModel {
  AvailebleLeaveModel({
    required this.xtypeleave,
    required this.xbalance,
  });

  String xtypeleave;
  String xbalance;

  factory AvailebleLeaveModel.fromJson(Map<String, dynamic> json) =>
      AvailebleLeaveModel(
        xtypeleave: json["xtypeleave"],
        xbalance: json["xbalance"],
      );

  Map<String, dynamic> toJson() => {
        "xtypeleave": xtypeleave,
        "xbalance": xbalance,
      };
}
