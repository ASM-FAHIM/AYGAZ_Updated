// To parse this JSON data, do
//
//     final soDetailsModel = soDetailsModelFromJson(jsonString);

import 'dart:convert';

List<SoDetailsModel> soDetailsModelFromJson(String str) =>
    List<SoDetailsModel>.from(
        json.decode(str).map((x) => SoDetailsModel.fromJson(x)));

String soDetailsModelToJson(List<SoDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SoDetailsModel {
  SoDetailsModel({
    required this.descr,
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xtornum,
    required this.xrow,
    required this.xitem,
    required this.xqtyord,
    required this.xunit,
    required this.xrate,
    this.xlineamt,
    required this.xvatrate,
    required this.xbatch,
    required this.xqtyreq,
    required this.xqtycom,
    required this.xstype,
    required this.xnote,
    required this.xdocrow,
    required this.xorderrow,
    required this.xgitem,
    required this.xprepqty,
    required this.xdphqty,
    required this.xqtypor,
    required this.xqtyalc,
    required this.xbrand,
    required this.xserial,
    required this.xqtycrn,
    required this.xsrnum,
    required this.xdate,
    required this.xbinref,
    required this.xqtylead,
    required this.xfwh,
    required this.xtwh,
  });

  dynamic descr;
  dynamic ztime;
  dynamic zutime;
  dynamic zauserid;
  dynamic zuuserid;
  int zid;
  dynamic xtornum;
  int xrow;
  dynamic xitem;
  dynamic xqtyord;
  dynamic xunit;
  dynamic xrate;
  dynamic xlineamt;
  dynamic xvatrate;
  dynamic xbatch;
  dynamic xqtyreq;
  dynamic xqtycom;
  dynamic xstype;
  dynamic xnote;
  dynamic xdocrow;
  dynamic xorderrow;
  dynamic xgitem;
  dynamic xprepqty;
  dynamic xdphqty;
  dynamic xqtypor;
  dynamic xqtyalc;
  dynamic xbrand;
  dynamic xserial;
  dynamic xqtycrn;
  dynamic xsrnum;
  dynamic xdate;
  dynamic xbinref;
  dynamic xqtylead;
  dynamic xfwh;
  dynamic xtwh;

  factory SoDetailsModel.fromJson(Map<String, dynamic> json) => SoDetailsModel(
        descr: json["descr"],
        ztime: json["ztime"],
        zutime: json["zutime"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        zid: json["zid"],
        xtornum: json["xtornum"],
        xrow: json["xrow"],
        xitem: json["xitem"],
        xqtyord: json["xqtyord"],
        xunit: json["xunit"],
        xrate: json["xrate"],
        xlineamt: json["xlineamt"],
        xvatrate: json["xvatrate"],
        xbatch: json["xbatch"],
        xqtyreq: json["xqtyreq"],
        xqtycom: json["xqtycom"],
        xstype: json["xstype"],
        xnote: json["xnote"],
        xdocrow: json["xdocrow"],
        xorderrow: json["xorderrow"],
        xgitem: json["xgitem"],
        xprepqty: json["xprepqty"],
        xdphqty: json["xdphqty"],
        xqtypor: json["xqtypor"],
        xqtyalc: json["xqtyalc"],
        xbrand: json["xbrand"],
        xserial: json["xserial"],
        xqtycrn: json["xqtycrn"],
        xsrnum: json["xsrnum"],
        xdate: json["xdate"],
        xbinref: json["xbinref"],
        xqtylead: json["xqtylead"],
        xfwh: json["xfwh"],
        xtwh: json["xtwh"],
      );

  Map<String, dynamic> toJson() => {
        "descr": descr,
        "ztime": ztime.toJson(),
        "zutime": zutime.toJson(),
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "zid": zid,
        "xtornum": xtornum,
        "xrow": xrow,
        "xitem": xitem,
        "xqtyord": xqtyord,
        "xunit": xunit,
        "xrate": xrate,
        "xlineamt": xlineamt,
        "xvatrate": xvatrate,
        "xbatch": xbatch,
        "xqtyreq": xqtyreq,
        "xqtycom": xqtycom,
        "xstype": xstype,
        "xnote": xnote,
        "xdocrow": xdocrow,
        "xorderrow": xorderrow,
        "xgitem": xgitem,
        "xprepqty": xprepqty,
        "xdphqty": xdphqty,
        "xqtypor": xqtypor,
        "xqtyalc": xqtyalc,
        "xbrand": xbrand,
        "xserial": xserial,
        "xqtycrn": xqtycrn,
        "xsrnum": xsrnum,
        "xdate": xdate,
        "xbinref": xbinref,
        "xqtylead": xqtylead,
        "xfwh": xfwh,
        "xtwh": xtwh,
      };
}

class Time {
  Time({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
