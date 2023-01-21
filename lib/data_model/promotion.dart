// To parse this JSON data, do
//
//     final promotionModel = promotionModelFromJson(jsonString);

import 'dart:convert';

List<PromotionModel> promotionModelFromJson(String str) => List<PromotionModel>.from(json.decode(str).map((x) => PromotionModel.fromJson(x)));

String promotionModelToJson(List<PromotionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PromotionModel {
  PromotionModel({
    required this.ximage,
  });

  String ximage;

  factory PromotionModel.fromJson(Map<String, dynamic> json) => PromotionModel(
    ximage: json["ximage"],
  );

  Map<String, dynamic> toJson() => {
    "ximage": ximage,
  };
}
