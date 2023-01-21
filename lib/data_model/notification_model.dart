// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) => List<NotificationModel>.from(json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel({
    required this.xposition,
    required this.xtitle,
    required this.xsubtitle,
    required this.xdetails,
  });

  String xposition;
  String xtitle;
  String xsubtitle;
  String xdetails;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    xposition: json["xposition"],
    xtitle: json["xtitle"],
    xsubtitle: json["xsubtitle"],
    xdetails: json["xdetails"],
  );

  Map<String, dynamic> toJson() => {
    "xposition": xposition,
    "xtitle": xtitle,
    "xsubtitle": xsubtitle,
    "xdetails": xdetails,
  };
}
