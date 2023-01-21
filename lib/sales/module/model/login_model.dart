// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.xsp,
    required this.xstaff,
    required this.xsm,
    required this.xrsm,
    required this.xname,
    required this.xphone,
    required this.xterritory,
    required this.xarea,
    required this.xsubcat,
  });

  String xsp;
  String xstaff;
  String xsm;
  String xrsm;
  String xname;
  String xphone;
  String xterritory;
  String xarea;
  String xsubcat;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    xsp: json["xsp"],
    xstaff: json["xstaff"],
    xsm: json["xsm"],
    xrsm: json["xrsm"],
    xname: json["xname"],
    xphone: json["xphone"],
    xterritory: json["xterritory"],
    xarea: json["xarea"],
    xsubcat: json["xsubcat"],
  );

  Map<String, dynamic> toJson() => {
    "xsp": xsp,
    "xstaff": xstaff,
    "xsm": xsm,
    "xrsm": xrsm,
    "xname": xname,
    "xphone": xphone,
    "xterritory": xterritory,
    "xarea": xarea,
    "xsubcat": xsubcat,
  };
}
