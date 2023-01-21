// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
  SearchModel({
    required this.xstaff,
  });

  String xstaff;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    xstaff: json["xstaff"],
  );

  Map<String, dynamic> toJson() => {
    "xstaff": xstaff,
  };
}
