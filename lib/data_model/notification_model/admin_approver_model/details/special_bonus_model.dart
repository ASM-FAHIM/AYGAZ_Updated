// To parse this JSON data, do
//
//     final specialBonusModel = specialBonusModelFromJson(jsonString);

import 'dart:convert';

List<SpecialBonusModel> specialBonusModelFromJson(String str) =>
    List<SpecialBonusModel>.from(
        json.decode(str).map((x) => SpecialBonusModel.fromJson(x)));

String specialBonusModelToJson(List<SpecialBonusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecialBonusModel {
  SpecialBonusModel({
    required this.xitem,
    required this.xqty,
    required this.xqtybonus,
  });

  String xitem;
  int xqty;
  int xqtybonus;

  factory SpecialBonusModel.fromJson(Map<String, dynamic> json) =>
      SpecialBonusModel(
        xitem: json["xitem"],
        xqty: json["xqty"],
        xqtybonus: json["xqtybonus"],
      );

  Map<String, dynamic> toJson() => {
        "xitem": xitem,
        "xqty": xqty,
        "xqtybonus": xqtybonus,
      };
}
