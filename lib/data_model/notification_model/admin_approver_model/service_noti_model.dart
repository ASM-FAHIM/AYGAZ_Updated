// To parse this JSON data, do
//
//     final serviceNotifyModel = serviceNotifyModelFromJson(jsonString);

import 'dart:convert';

List<ServiceNotifyModel> serviceNotifyModelFromJson(String str) =>
    List<ServiceNotifyModel>.from(
        json.decode(str).map((x) => ServiceNotifyModel.fromJson(x)));

String serviceNotifyModelToJson(List<ServiceNotifyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceNotifyModel {
  ServiceNotifyModel({
    required this.xitem,
    required this.xdesc,
    required this.xunit,
    required this.xcatitem,
    required this.xgitem,
    required this.xtitem,
    required this.xvatamt,
    required this.xtaxrate,
    required this.xnote,
    required this.xstatus,
    required this.xpreparer,
  });

  String xitem;
  String xdesc;
  String xunit;
  String xcatitem;
  String xgitem;
  String xtitem;
  String xvatamt;
  String xtaxrate;
  dynamic xnote;
  String xstatus;
  String xpreparer;

  factory ServiceNotifyModel.fromJson(Map<String, dynamic> json) =>
      ServiceNotifyModel(
        xitem: json["xitem"],
        xdesc: json["xdesc"],
        xunit: json["xunit"],
        xcatitem: json["xcatitem"],
        xgitem: json["xgitem"],
        xtitem: json["xtitem"],
        xvatamt: json["xvatamt"],
        xtaxrate: json["xtaxrate"],
        xnote: json["xnote"],
        xstatus: json["xstatus"],
        xpreparer: json["xpreparer"],
      );

  Map<String, dynamic> toJson() => {
        "xitem": xitem,
        "xdesc": xdesc,
        "xunit": xunit,
        "xcatitem": xcatitem,
        "xgitem": xgitem,
        "xtitem": xtitem,
        "xvatamt": xvatamt,
        "xtaxrate": xtaxrate,
        "xnote": xnote,
        "xstatus": xstatus,
        "xpreparer": xpreparer,
      };
}
