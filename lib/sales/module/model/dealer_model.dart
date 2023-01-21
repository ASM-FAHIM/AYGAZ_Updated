// To parse this JSON data, do
//
//     final dealerModel = dealerModelFromJson(jsonString);

import 'dart:convert';

List<DealerModel> dealerModelFromJson(String str) => List<DealerModel>.from(
    json.decode(str).map((x) => DealerModel.fromJson(x)));

String dealerModelToJson(List<DealerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DealerModel {
  DealerModel({
    this.id,
    required this.xso,
    required this.xcus,
    required this.xorg,
    required this.xterritory,
    required this.xsubcat,
    required this.xareaop,
    required this.xdivisionop,
  });

  int? id;
  String xso;
  String xcus;
  String xorg;
  String xterritory;
  String xsubcat;
  String xareaop;
  String xdivisionop;

  factory DealerModel.fromJson(Map<String, dynamic> json) => DealerModel(
        id: json["id"],
        xso: json["xso"],
        xcus: json["xcus"],
        xorg: json["xorg"] ?? ' ',
        xterritory: json["xterritory"] ?? ' ',
        xsubcat: json["xsubcat"] ?? ' ',
        xareaop: json["xareaop"] ?? ' ',
        xdivisionop: json["xdivisionop"] ?? ' ',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "xso": xso,
        "xcus": xcus,
        "xorg": xorg,
        "xterritory": xterritory,
        "xsubcat": xsubcat,
        "xareaop": xareaop,
        "xdivisionop": xdivisionop,
      };
}
