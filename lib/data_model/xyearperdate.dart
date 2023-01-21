// To parse this JSON data, do
//
//     final xyearperdate = xyearperdateFromJson(jsonString);

import 'dart:convert';

Xyearperdate xyearperdateFromJson(String str) => Xyearperdate.fromJson(json.decode(str));

String xyearperdateToJson(Xyearperdate data) => json.encode(data.toJson());

class Xyearperdate {
  Xyearperdate({
    required this.xyearperdate,
  });

  int xyearperdate;

  factory Xyearperdate.fromJson(Map<String, dynamic> json) => Xyearperdate(
    xyearperdate: json["xyearperdate"],
  );

  Map<String, dynamic> toJson() => {
    "xyearperdate": xyearperdate,
  };
}



// To parse this JSON data, do
//
//     final xbalanceModel = xbalanceModelFromJson(jsonString);

// import 'dart:convert';

// XbalanceModel xbalanceModelFromJson(String str) => XbalanceModel.fromJson(json.decode(str));
//
// String xbalanceModelToJson(XbalanceModel data) => json.encode(data.toJson());
// To parse this JSON data, do
//
//     final xbalanceModel = xbalanceModelFromJson(jsonString);


XbalanceModel xbalanceModelFromJson(String str) => XbalanceModel.fromJson(json.decode(str));

String xbalanceModelToJson(XbalanceModel data) => json.encode(data.toJson());

class XbalanceModel {
  XbalanceModel({
    required this.xavailable,
    required this.xused,
    required this.xbalance,
  });

  dynamic xavailable;
  dynamic xused;
  dynamic xbalance;

  factory XbalanceModel.fromJson(Map<String, dynamic> json) => XbalanceModel(
    xavailable: json["xavailable"],
    xused: json["xused"],
    xbalance: json["xbalance"],
  );

  Map<String, dynamic> toJson() => {
    "xavailable": xavailable,
    "xused": xused,
    "xbalance": xbalance,
  };
}
