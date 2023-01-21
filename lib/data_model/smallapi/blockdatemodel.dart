// To parse this JSON data, do
//
//     final blockeddateModel = blockeddateModelFromJson(jsonString);

import 'dart:convert';

BlockeddateModel blockeddateModelFromJson(String str) => BlockeddateModel.fromJson(json.decode(str));

String blockeddateModelToJson(BlockeddateModel data) => json.encode(data.toJson());

class BlockeddateModel {
  BlockeddateModel({
    required this.applydate,
  });

  dynamic applydate;

  factory BlockeddateModel.fromJson(Map<String, dynamic> json) => BlockeddateModel(
    applydate: json["applydate"],
  );

  Map<String, dynamic> toJson() => {
    "applydate": applydate,
  };
}
