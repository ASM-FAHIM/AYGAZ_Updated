// To parse this JSON data, do
//
//     final apiSql = apiSqlFromJson(jsonString);

import 'dart:convert';

List<ApiSql> apiSqlFromJson(String str) => List<ApiSql>.from(json.decode(str).map((x) => ApiSql.fromJson(x)));

String apiSqlToJson(List<ApiSql> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiSql {
  ApiSql({
    required this.firstName,
    required this.lastName,
  });

  String firstName;
  String lastName;

  factory ApiSql.fromJson(Map<String, dynamic> json) => ApiSql(
    firstName: json["FirstName"],
    lastName: json["LastName"],
  );

  Map<String, dynamic> toJson() => {
    "FirstName": firstName,
    "LastName": lastName,
  };
}
