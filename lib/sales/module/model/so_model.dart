// To parse this JSON data, do
//
//     final soModel = soModelFromJson(jsonString);

import 'dart:convert';

SoModel? soModelFromJson(String str) => SoModel.fromJson(json.decode(str));

String soModelToJson(SoModel? data) => json.encode(data!.toJson());

class SoModel {
  SoModel({
    required this.sOnum,
  });

  String? sOnum;

  factory SoModel.fromJson(Map<String, dynamic> json) => SoModel(
    sOnum: json["SOnum"],
  );

  Map<String, dynamic> toJson() => {
    "SOnum": sOnum,
  };
}
