// To parse this JSON data, do
//
//     final totalApiModel = totalApiModelFromJson(jsonString);
//
// import 'dart:convert';
//
// TotalApiModel totalApiModelFromJson(String str) => TotalApiModel.fromJson(json.decode(str));
//
// String totalApiModelToJson(TotalApiModel data) => json.encode(data.toJson());
//
// class TotalApiModel {
//   TotalApiModel({
//     required this.total,
//   });
//
//   dynamic total;
//
//   factory TotalApiModel.fromJson(Map<String, dynamic> json) => TotalApiModel(
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "total": total,
//   };
// }


// To parse this JSON data, do
//
//     final totalApiModel = totalApiModelFromJson(jsonString);

import 'dart:convert';

List<TotalApiModel> totalApiModelFromJson(String str) => List<TotalApiModel>.from(json.decode(str).map((x) => TotalApiModel.fromJson(x)));

String totalApiModelToJson(List<TotalApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TotalApiModel {
  TotalApiModel({
    required this.total,
  });

  dynamic total;

  factory TotalApiModel.fromJson(Map<String, dynamic> json) => TotalApiModel(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}
