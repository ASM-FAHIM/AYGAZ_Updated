// To parse this JSON data, do
//
//     final supplierNotificationModel = supplierNotificationModelFromJson(jsonString);

import 'dart:convert';

List<SupplierNotificationModel> supplierNotificationModelFromJson(String str) =>
    List<SupplierNotificationModel>.from(
        json.decode(str).map((x) => SupplierNotificationModel.fromJson(x)));

String supplierNotificationModelToJson(List<SupplierNotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupplierNotificationModel {
  SupplierNotificationModel({
    required this.xcus,
    required this.xorg,
    required this.xmadd,
    required this.xemail,
    required this.xphone,
    required this.xmobile,
    required this.xurl,
    required this.xgsup,
    required this.xcontact,
    required this.xvatrate,
    required this.xbank,
    required this.xbranch,
    required this.xrouting,
    required this.xacc,
    required this.xacctype,
    required this.xnote1,
    required this.xstatus,
    required this.xpreparer,
  });

  dynamic xcus;
  dynamic xorg;
  dynamic xmadd;
  dynamic xemail;
  dynamic xphone;
  dynamic xmobile;
  dynamic xurl;
  dynamic xgsup;
  dynamic xcontact;
  dynamic xvatrate;
  dynamic xbank;
  dynamic xbranch;
  dynamic xrouting;
  dynamic xacc;
  dynamic xacctype;
  dynamic xnote1;
  dynamic xstatus;
  dynamic xpreparer;

  factory SupplierNotificationModel.fromJson(Map<String, dynamic> json) =>
      SupplierNotificationModel(
        xcus: json["xcus"],
        xorg: json["xorg"],
        xmadd: json["xmadd"],
        xemail: json["xemail"],
        xphone: json["xphone"],
        xmobile: json["xmobile"],
        xurl: json["xurl"],
        xgsup: json["xgsup"],
        xcontact: json["xcontact"],
        xvatrate: json["xvatrate"],
        xbank: json["xbank"],
        xbranch: json["xbranch"],
        xrouting: json["xrouting"],
        xacc: json["xacc"],
        xacctype: json["xacctype"],
        xnote1: json["xnote1"],
        xstatus: json["xstatus"],
        xpreparer: json["xpreparer"],
      );

  Map<String, dynamic> toJson() => {
        "xcus": xcus,
        "xorg": xorg,
        "xmadd": xmadd,
        "xemail": xemail,
        "xphone": xphone,
        "xmobile": xmobile,
        "xurl": xurl,
        "xgsup": xgsup,
        "xcontact": xcontact,
        "xvatrate": xvatrate,
        "xbank": xbank,
        "xbranch": xbranch,
        "xrouting": xrouting,
        "xacc": xacc,
        "xacctype": xacctype,
        "xnote1": xnote1,
        "xstatus": xstatus,
        "xpreparer": xpreparer,
      };
}
