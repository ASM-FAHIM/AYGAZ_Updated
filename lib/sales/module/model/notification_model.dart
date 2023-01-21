// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel?>? notificationModelFromJson(String str) => json.decode(str) == null ? [] : List<NotificationModel?>.from(json.decode(str)!.map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class NotificationModel {
  NotificationModel({
    this.xtornum,
    this.xdate,
    this.xcus,
    this.cusname,
    this.xstatustor,
    this.xterritory,
  });

  String? xtornum;
  String? xdate;
  String? xcus;
  String? cusname;
  String? xstatustor;
  String? xterritory;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    xtornum: json["xtornum"],
    xdate: json["xdate"],
    xcus: json["xcus"],
    cusname: json["cusname"],
    xstatustor: json["xstatustor"],
    xterritory: json["xterritory"],
  );

  Map<String, dynamic> toJson() => {
    "xtornum": xtornum,
    "xdate": xdate,
    "xcus": xcus,
    "cusname": cusname,
    "xstatustor": xstatustor,
    "xterritory": xterritory,
  };
}
