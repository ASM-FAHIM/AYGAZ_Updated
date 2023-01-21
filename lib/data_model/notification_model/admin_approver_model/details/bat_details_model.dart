// To parse this JSON data, do
//
//     final batDetailsModel = batDetailsModelFromJson(jsonString);

import 'dart:convert';

List<BatDetailsModel> batDetailsModelFromJson(String str) =>
    List<BatDetailsModel>.from(
        json.decode(str).map((x) => BatDetailsModel.fromJson(x)));

String batDetailsModelToJson(List<BatDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BatDetailsModel {
  BatDetailsModel({
    required this.des,
    required this.unit,
    required this.ztime,
    required this.zutime,
    required this.zid,
    required this.zauserid,
    required this.zuuserid,
    required this.xbatch,
    required this.xrow,
    required this.xitem,
    required this.xqtymor,
    required this.xqtyreq,
    required this.xcomposition,
    required this.xfabrictype,
    required this.xwidth,
    required this.xgsm,
    required this.xfabriccolor,
    required this.xprcstype,
    required this.xorderrow,
    required this.xpercent,
    required this.xreedcount,
    required this.xnote,
    required this.xdesc,
    required this.xlong,
    required this.xwh,
    required this.xsup,
    required this.xqtykit,
    required this.xqtypor,
    required this.xpornum,
    required this.xporrow,
    required this.xgass,
    required this.xavail,
    required this.xstype,
    required this.xtype,
    required this.xbomrow,
    required this.xqtyord,
    required this.xamount,
    required this.xlineamt,
  });

  dynamic des;
  dynamic unit;
  Ztime ztime;
  dynamic zutime;
  int zid;
  dynamic zauserid;
  dynamic zuuserid;
  dynamic xbatch;
  int xrow;
  dynamic xitem;
  dynamic xqtymor;
  dynamic xqtyreq;
  dynamic xcomposition;
  dynamic xfabrictype;
  dynamic xwidth;
  dynamic xgsm;
  dynamic xfabriccolor;
  dynamic xprcstype;
  dynamic xorderrow;
  dynamic xpercent;
  dynamic xreedcount;
  dynamic xnote;
  dynamic xdesc;
  dynamic xlong;
  dynamic xwh;
  dynamic xsup;
  dynamic xqtykit;
  dynamic xqtypor;
  dynamic xpornum;
  int xporrow;
  dynamic xgass;
  dynamic xavail;
  dynamic xstype;
  dynamic xtype;
  int xbomrow;
  dynamic xqtyord;
  dynamic xamount;
  dynamic xlineamt;

  factory BatDetailsModel.fromJson(Map<String, dynamic> json) =>
      BatDetailsModel(
        des: json["des"],
        unit: json["unit"],
        ztime: Ztime.fromJson(json["ztime"]),
        zutime: json["zutime"],
        zid: json["zid"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        xbatch: json["xbatch"],
        xrow: json["xrow"],
        xitem: json["xitem"],
        xqtymor: json["xqtymor"],
        xqtyreq: json["xqtyreq"],
        xcomposition: json["xcomposition"],
        xfabrictype: json["xfabrictype"],
        xwidth: json["xwidth"],
        xgsm: json["xgsm"],
        xfabriccolor: json["xfabriccolor"],
        xprcstype: json["xprcstype"],
        xorderrow: json["xorderrow"],
        xpercent: json["xpercent"],
        xreedcount: json["xreedcount"],
        xnote: json["xnote"],
        xdesc: json["xdesc"],
        xlong: json["xlong"],
        xwh: json["xwh"],
        xsup: json["xsup"],
        xqtykit: json["xqtykit"],
        xqtypor: json["xqtypor"],
        xpornum: json["xpornum"],
        xporrow: json["xporrow"],
        xgass: json["xgass"],
        xavail: json["xavail"],
        xstype: json["xstype"],
        xtype: json["xtype"],
        xbomrow: json["xbomrow"],
        xqtyord: json["xqtyord"],
        xamount: json["xamount"],
        xlineamt: json["xlineamt"],
      );

  Map<String, dynamic> toJson() => {
        "des": des,
        "unit": unit,
        "ztime": ztime.toJson(),
        "zutime": zutime,
        "zid": zid,
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "xbatch": xbatch,
        "xrow": xrow,
        "xitem": xitem,
        "xqtymor": xqtymor,
        "xqtyreq": xqtyreq,
        "xcomposition": xcomposition,
        "xfabrictype": xfabrictype,
        "xwidth": xwidth,
        "xgsm": xgsm,
        "xfabriccolor": xfabriccolor,
        "xprcstype": xprcstype,
        "xorderrow": xorderrow,
        "xpercent": xpercent,
        "xreedcount": xreedcount,
        "xnote": xnote,
        "xdesc": xdesc,
        "xlong": xlong,
        "xwh": xwh,
        "xsup": xsup,
        "xqtykit": xqtykit,
        "xqtypor": xqtypor,
        "xpornum": xpornum,
        "xporrow": xporrow,
        "xgass": xgass,
        "xavail": xavail,
        "xstype": xstype,
        "xtype": xtype,
        "xbomrow": xbomrow,
        "xqtyord": xqtyord,
        "xamount": xamount,
        "xlineamt": xlineamt,
      };
}

class Ztime {
  Ztime({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Ztime.fromJson(Map<String, dynamic> json) => Ztime(
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
