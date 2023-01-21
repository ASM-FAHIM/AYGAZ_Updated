// To parse this JSON data, do
//
//     final deductApiModel = deductApiModelFromJson(jsonString);

import 'dart:convert';

List<DeductApiModel> deductApiModelFromJson(String str) => List<DeductApiModel>.from(json.decode(str).map((x) => DeductApiModel.fromJson(x)));

String deductApiModelToJson(List<DeductApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeductApiModel {
  DeductApiModel({
    required this.xtype,
    required this.xamount,
  });

  String xtype;
  String xamount;

  factory DeductApiModel.fromJson(Map<String, dynamic> json) => DeductApiModel(
    xtype: json["xtype"],
    xamount: json["xamount"],
  );

  Map<String, dynamic> toJson() => {
    "xtype": xtype,
    "xamount": xamount,
  };
}
