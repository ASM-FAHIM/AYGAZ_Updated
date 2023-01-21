// To parse this JSON data, do
//
//     final zidModel = zidModelFromJson(jsonString);

import 'dart:convert';

List<ZidModel> zidModelFromJson(String str) =>
    List<ZidModel>.from(json.decode(str).map((x) => ZidModel.fromJson(x)));

String zidModelToJson(List<ZidModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ZidModel {
  ZidModel({
    required this.zid,
    required this.zorg,
  });

  int zid;
  String zorg;

  factory ZidModel.fromJson(Map<String, dynamic> json) => ZidModel(
        zid: json["zid"],
        zorg: json["zorg"],
      );

  Map<String, dynamic> toJson() => {
        "zid": zid,
        "zorg": zorg,
      };
}
