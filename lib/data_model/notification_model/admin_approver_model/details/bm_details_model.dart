// To parse this JSON data, do
//
//     final bmDetailsModel = bmDetailsModelFromJson(jsonString);

import 'dart:convert';

List<BmDetailsModel> bmDetailsModelFromJson(String str) =>
    List<BmDetailsModel>.from(
        json.decode(str).map((x) => BmDetailsModel.fromJson(x)));

String bmDetailsModelToJson(List<BmDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BmDetailsModel {
  BmDetailsModel({
    required this.descr,
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xbomkey,
    required this.xbomrow,
    required this.xbomcomp,
    required this.xqtymix,
    required this.xunit,
    required this.xeco,
    required this.xecorow,
    required this.xstype,
    required this.xdateeff,
    required this.xdateexp,
    required this.xcalc,
    required this.xstdsize,
    required this.xroundup,
    required this.xgass,
    required this.xaltparts,
    required this.xfixedqty,
    required this.xwh,
    required this.xassembly,
    required this.xpercent,
    required this.xamount,
    required this.xtype,
    required this.xrate,
    required this.xqtywast,
  });

  dynamic descr;
  Time ztime;
  dynamic zutime;
  dynamic zauserid;
  dynamic zuuserid;
  int zid;
  dynamic xbomkey;
  int xbomrow;
  dynamic xbomcomp;
  dynamic xqtymix;
  dynamic xunit;
  dynamic xeco;
  dynamic xecorow;
  dynamic xstype;
  dynamic xdateeff;
  dynamic xdateexp;
  dynamic xcalc;
  dynamic xstdsize;
  dynamic xroundup;
  dynamic xgass;
  dynamic xaltparts;
  dynamic xfixedqty;
  dynamic xwh;
  dynamic xassembly;
  dynamic xpercent;
  dynamic xamount;
  dynamic xtype;
  dynamic xrate;
  dynamic xqtywast;

  factory BmDetailsModel.fromJson(Map<String, dynamic> json) => BmDetailsModel(
        descr: json["descr"],
        ztime: Time.fromJson(json["ztime"]),
        zutime: json["zutime"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"] == null ? null : json["zuuserid"],
        zid: json["zid"],
        xbomkey: json["xbomkey"],
        xbomrow: json["xbomrow"],
        xbomcomp: json["xbomcomp"],
        xqtymix: json["xqtymix"],
        xunit: json["xunit"],
        xeco: json["xeco"],
        xecorow: json["xecorow"],
        xstype: json["xstype"],
        xdateeff: json["xdateeff"],
        xdateexp: json["xdateexp"],
        xcalc: json["xcalc"],
        xstdsize: json["xstdsize"],
        xroundup: json["xroundup"],
        xgass: json["xgass"],
        xaltparts: json["xaltparts"],
        xfixedqty: json["xfixedqty"],
        xwh: json["xwh"],
        xassembly: json["xassembly"],
        xpercent: json["xpercent"],
        xamount: json["xamount"],
        xtype: json["xtype"],
        xrate: json["xrate"],
        xqtywast: json["xqtywast"],
      );

  Map<String, dynamic> toJson() => {
        "descr": descr,
        "ztime": ztime.toJson(),
        "zutime": zutime.toJson(),
        "zauserid": zauserid,
        "zuuserid": zuuserid == null ? null : zuuserid,
        "zid": zid,
        "xbomkey": xbomkey,
        "xbomrow": xbomrow,
        "xbomcomp": xbomcomp,
        "xqtymix": xqtymix,
        "xunit": xunit,
        "xeco": xeco,
        "xecorow": xecorow,
        "xstype": xstype,
        "xdateeff": xdateeff,
        "xdateexp": xdateexp,
        "xcalc": xcalc,
        "xstdsize": xstdsize,
        "xroundup": xroundup,
        "xgass": xgass,
        "xaltparts": xaltparts,
        "xfixedqty": xfixedqty,
        "xwh": xwh,
        "xassembly": xassembly,
        "xpercent": xpercent,
        "xamount": xamount,
        "xtype": xtype,
        "xrate": xrate,
        "xqtywast": xqtywast,
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
