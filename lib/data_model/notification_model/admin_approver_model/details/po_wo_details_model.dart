// To parse this JSON data, do
//
//     final poDetailsModel = poDetailsModelFromJson(jsonString);

import 'dart:convert';

List<PoDetailsModel> poDetailsModelFromJson(String str) => List<PoDetailsModel>.from(json.decode(str).map((x) => PoDetailsModel.fromJson(x)));

String poDetailsModelToJson(List<PoDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoDetailsModel {
  PoDetailsModel({
    required this.currency,
    required this.povatrate,
    required this.vatperrate,
    required this.xvatamt,
    required this.vtrate,
    required this.xcur,
    required this.povalue,
    required this.unitiss,
    required this.zid,
    required this.xlcno,
    required this.xpornum,
    required this.xrow,
    required this.xitem,
    required this.xdesc,
    required this.xqtypur,
    required this.xunitpur,
    required this.xrate,
    required this.xlineamt,
    required this.xspecification,
    required this.xbase,
    required this.xrategrn,
    required this.xnote,
    required this.xserial,
    required this.xqtygrn,
    required this.xporef,
    required this.xqtyprn,
    required this.xdisc,
    required this.xdiscamt,
    required this.xfreightrate,
  });
  dynamic currency;
  dynamic povatrate;
  dynamic vatperrate;
  dynamic xvatamt;
  dynamic vtrate;
  dynamic xcur;
  dynamic povalue;
  dynamic unitiss;
  int zid;
  dynamic xlcno;
  dynamic xpornum;
  int xrow;
  dynamic xitem;
  dynamic xdesc;
  dynamic xqtypur;
  dynamic xunitpur;
  dynamic xrate;
  dynamic xlineamt;
  dynamic xspecification;
  dynamic xbase;
  dynamic xrategrn;
  dynamic xnote;
  dynamic xserial;
  dynamic xqtygrn;
  dynamic xporef;
  dynamic xqtyprn;
  dynamic xdisc;
  dynamic xdiscamt;
  dynamic xfreightrate;

  factory PoDetailsModel.fromJson(Map<String, dynamic> json) => PoDetailsModel(
    currency: json["currency"],povatrate: json["povatrate"],
    vatperrate: json["vatperrate"],
    xvatamt: json["xvatamt"],
    vtrate: json["vtrate"],
    xcur: json["xcur"],
    povalue: json["povalue"],
    unitiss: json["unitiss"],
    zid: json["zid"],
    xlcno: json["xlcno"],
    xpornum: json["xpornum"],
    xrow: json["xrow"],
    xitem: json["xitem"],
    xdesc: json["xdesc"],
    xqtypur: json["xqtypur"],
    xunitpur: json["xunitpur"],
    xrate: json["xrate"],
    xlineamt: json["xlineamt"],
    xspecification: json["xspecification"],
    xbase: json["xbase"],
    xrategrn: json["xrategrn"],
    xnote: json["xnote"],
    xserial: json["xserial"],
    xqtygrn: json["xqtygrn"],
    xporef: json["xporef"],
    xqtyprn: json["xqtyprn"],
    xdisc: json["xdisc"],
    xdiscamt: json["xdiscamt"],
    xfreightrate: json["xfreightrate"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,"povatrate": povatrate,
    "vatperrate": vatperrate,
    "xvatamt": xvatamt,
    "vtrate": vtrate,
    "xcur": xcur,
    "povalue": povalue,
    "unitiss": unitiss,
    "zid": zid,
    "xlcno": xlcno,
    "xpornum": xpornum,
    "xrow": xrow,
    "xitem": xitem,
    "xdesc": xdesc,
    "xqtypur": xqtypur,
    "xunitpur": xunitpur,
    "xrate": xrate,
    "xlineamt": xlineamt,
    "xspecification": xspecification,
    "xbase": xbase,
    "xrategrn": xrategrn,
    "xnote": xnote,
    "xserial": xserial,
    "xqtygrn": xqtygrn,
    "xporef": xporef,
    "xqtyprn": xqtyprn,
    "xdisc": xdisc,
    "xdiscamt": xdiscamt,
    "xfreightrate": xfreightrate,
  };
}
