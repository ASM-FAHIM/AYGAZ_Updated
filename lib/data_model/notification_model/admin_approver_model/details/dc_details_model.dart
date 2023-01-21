// To parse this JSON data, do
//
//     final dcDetailsModel = dcDetailsModelFromJson(jsonString);

import 'dart:convert';

List<DcDetailsModel> dcDetailsModelFromJson(String str) =>
    List<DcDetailsModel>.from(
        json.decode(str).map((x) => DcDetailsModel.fromJson(x)));

String dcDetailsModelToJson(List<DcDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DcDetailsModel {
  DcDetailsModel({
    required this.des,
    required this.unit,
    required this.ztime,
    required this.zutime,
    required this.zid,
    required this.zauserid,
    required this.zuuserid,
    required this.xdocnum,
    required this.xdocrow,
    required this.xitem,
    required this.xqtydoc,
    required this.xdornum,
    required this.xordernum,
    required this.xdorrow,
    required this.xorderrow,
    required this.xrate,
    required this.xlineamt,
    required this.xnote,
    required this.xretqty,
    required this.xvatamt,
    required this.xdate,
    required this.xunit,
    required this.xunitsel,
    required this.xqtytr,
    required this.xvatrate,
    required this.xcost,
    required this.xqtybonus,
    required this.xtornum,
    required this.xavail,
    required this.xref,
    required this.xqtytol,
    required this.xbnprintstatus,
    required this.xlong,
    required this.xqtycom,
    required this.xstatus,
  });

  dynamic des;
  dynamic unit;
  dynamic ztime;
  dynamic zutime;
  int zid;
  dynamic zauserid;
  dynamic zuuserid;
  dynamic xdocnum;
  int xdocrow;
  dynamic xitem;
  dynamic xqtydoc;
  dynamic xdornum;
  dynamic xordernum;
  dynamic xdorrow;
  dynamic xorderrow;
  dynamic xrate;
  dynamic xlineamt;
  dynamic xnote;
  dynamic xretqty;
  dynamic xvatamt;
  dynamic xdate;
  dynamic xunit;
  dynamic xunitsel;
  dynamic xqtytr;
  dynamic xvatrate;
  dynamic xcost;
  int xqtybonus;
  dynamic xtornum;
  dynamic xavail;
  dynamic xref;
  dynamic xqtytol;
  dynamic xbnprintstatus;
  dynamic xlong;
  dynamic xqtycom;
  dynamic xstatus;

  factory DcDetailsModel.fromJson(Map<String, dynamic> json) => DcDetailsModel(
        des: json["des"],
        unit: json["unit"],
        ztime: json["ztime"],
        zutime: json["zutime"],
        zid: json["zid"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        xdocnum: json["xdocnum"],
        xdocrow: json["xdocrow"],
        xitem: json["xitem"],
        xqtydoc: json["xqtydoc"],
        xdornum: json["xdornum"],
        xordernum: json["xordernum"],
        xdorrow: json["xdorrow"],
        xorderrow: json["xorderrow"],
        xrate: json["xrate"],
        xlineamt: json["xlineamt"],
        xnote: json["xnote"],
        xretqty: json["xretqty"],
        xvatamt: json["xvatamt"],
        xdate: json["xdate"],
        xunit: json["xunit"],
        xunitsel: json["xunitsel"],
        xqtytr: json["xqtytr"],
        xvatrate: json["xvatrate"],
        xcost: json["xcost"],
        xqtybonus: json["xqtybonus"],
        xtornum: json["xtornum"],
        xavail: json["xavail"],
        xref: json["xref"],
        xqtytol: json["xqtytol"],
        xbnprintstatus: json["xbnprintstatus"],
        xlong: json["xlong"],
        xqtycom: json["xqtycom"],
        xstatus: json["xstatus"],
      );

  Map<String, dynamic> toJson() => {
        "des": des,
        "unit": unit,
        "ztime": ztime.toJson(),
        "zutime": zutime.toJson(),
        "zid": zid,
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "xdocnum": xdocnum,
        "xdocrow": xdocrow,
        "xitem": xitem,
        "xqtydoc": xqtydoc,
        "xdornum": xdornum,
        "xordernum": xordernum,
        "xdorrow": xdorrow,
        "xorderrow": xorderrow,
        "xrate": xrate,
        "xlineamt": xlineamt,
        "xnote": xnote,
        "xretqty": xretqty,
        "xvatamt": xvatamt,
        "xdate": xdate,
        "xunit": xunit,
        "xunitsel": xunitsel,
        "xqtytr": xqtytr,
        "xvatrate": xvatrate,
        "xcost": xcost,
        "xqtybonus": xqtybonus,
        "xtornum": xtornum,
        "xavail": xavail,
        "xref": xref,
        "xqtytol": xqtytol,
        "xbnprintstatus": xbnprintstatus,
        "xlong": xlong,
        "xqtycom": xqtycom,
        "xstatus": xstatus,
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
