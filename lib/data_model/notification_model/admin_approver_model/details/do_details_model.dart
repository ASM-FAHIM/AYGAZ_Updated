// To parse this JSON data, do
//
//     final doDetailsModel = doDetailsModelFromJson(jsonString);

import 'dart:convert';

List<DoDetailsModel> doDetailsModelFromJson(String str) =>
    List<DoDetailsModel>.from(
        json.decode(str).map((x) => DoDetailsModel.fromJson(x)));

String doDetailsModelToJson(List<DoDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoDetailsModel {
  DoDetailsModel({
    required this.descr,
    required this.unit,
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.zemail,
    required this.xdornum,
    required this.xrow,
    required this.xitem,
    required this.xlong,
    required this.xvatrate,
    required this.xvatamt,
    required this.xqtyord,
    required this.xunit,
    required this.xrate,
    required this.xlineamt,
    required this.xchallanitem,
    required this.xqtybonus,
    required this.xpricerow,
    required this.xdiscdet,
    required this.xdiscdetamt,
    required this.xdoctype,
    required this.xcost,
    required this.xqtytr,
    required this.xpacking,
    required this.xqtycrn,
    required this.xdisctype,
    required this.xsprate,
    required this.xnetamt,
    required this.xqtybntr,
    required this.xdiscdetamttr,
    required this.xvatamttr,
    required this.xnetamttr,
    required this.xdiscstatus,
    required this.xbnprintstatus,
    required this.xdocrow,
    required this.xdorrow,
    required this.xgcost,
    required this.xdocnum,
    required this.xdate,
    required this.xcomm,
    required this.xrem,
    required this.zactive,
    required this.xnote,
    required this.xretqty,
    required this.xstatusgl,
    required this.xdiscamt,
    required this.xtransportamt,
    required this.xqty,
    required this.xunitsel,
    required this.xserialnum,
    required this.xwperiod,
    required this.xwperiodtype,
    required this.xporate,
    required this.xref,
    required this.xdisc,
    required this.xbonuspoints,
    required this.xparentitem,
    required this.xrategrn,
    required this.xratesys,
    required this.xsupptaxrate,
    required this.xsupptaxamt,
    required this.xserial,
    required this.xdateeff,
    required this.xdateexp,
    required this.xtornum,
    required this.xavail,
  });

  dynamic descr;
  dynamic unit;
  Ztime ztime;
  dynamic zutime;
  dynamic zauserid;
  dynamic zuuserid;
  int zid;
  dynamic zemail;
  dynamic xdornum;
  int xrow;
  dynamic xitem;
  dynamic xlong;
  dynamic xvatrate;
  dynamic xvatamt;
  dynamic xqtyord;
  dynamic xunit;
  dynamic xrate;
  dynamic xlineamt;
  dynamic xchallanitem;
  int xqtybonus;
  dynamic xpricerow;
  dynamic xdiscdet;
  dynamic xdiscdetamt;
  dynamic xdoctype;
  dynamic xcost;
  dynamic xqtytr;
  dynamic xpacking;
  dynamic xqtycrn;
  dynamic xdisctype;
  dynamic xsprate;
  dynamic xnetamt;
  dynamic xqtybntr;
  dynamic xdiscdetamttr;
  dynamic xvatamttr;
  dynamic xnetamttr;
  dynamic xdiscstatus;
  dynamic xbnprintstatus;
  dynamic xdocrow;
  dynamic xdorrow;
  dynamic xgcost;
  dynamic xdocnum;
  dynamic xdate;
  dynamic xcomm;
  dynamic xrem;
  dynamic zactive;
  dynamic xnote;
  dynamic xretqty;
  dynamic xstatusgl;
  dynamic xdiscamt;
  dynamic xtransportamt;
  dynamic xqty;
  dynamic xunitsel;
  dynamic xserialnum;
  dynamic xwperiod;
  dynamic xwperiodtype;
  dynamic xporate;
  dynamic xref;
  dynamic xdisc;
  dynamic xbonuspoints;
  dynamic xparentitem;
  dynamic xrategrn;
  dynamic xratesys;
  dynamic xsupptaxrate;
  dynamic xsupptaxamt;
  dynamic xserial;
  dynamic xdateeff;
  dynamic xdateexp;
  dynamic xtornum;
  dynamic xavail;

  factory DoDetailsModel.fromJson(Map<String, dynamic> json) => DoDetailsModel(
        descr: json["descr"],
        unit: json["unit"],
        ztime: Ztime.fromJson(json["ztime"]),
        zutime: json["zutime"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        zid: json["zid"],
        zemail: json["zemail"],
        xdornum: json["xdornum"],
        xrow: json["xrow"],
        xitem: json["xitem"],
        xlong: json["xlong"],
        xvatrate: json["xvatrate"],
        xvatamt: json["xvatamt"],
        xqtyord: json["xqtyord"],
        xunit: json["xunit"],
        xrate: json["xrate"],
        xlineamt: json["xlineamt"],
        xchallanitem: json["xchallanitem"],
        xqtybonus: json["xqtybonus"],
        xpricerow: json["xpricerow"],
        xdiscdet: json["xdiscdet"],
        xdiscdetamt: json["xdiscdetamt"],
        xdoctype: json["xdoctype"],
        xcost: json["xcost"],
        xqtytr: json["xqtytr"],
        xpacking: json["xpacking"],
        xqtycrn: json["xqtycrn"],
        xdisctype: json["xdisctype"],
        xsprate: json["xsprate"],
        xnetamt: json["xnetamt"],
        xqtybntr: json["xqtybntr"],
        xdiscdetamttr: json["xdiscdetamttr"],
        xvatamttr: json["xvatamttr"],
        xnetamttr: json["xnetamttr"],
        xdiscstatus: json["xdiscstatus"],
        xbnprintstatus: json["xbnprintstatus"],
        xdocrow: json["xdocrow"],
        xdorrow: json["xdorrow"],
        xgcost: json["xgcost"],
        xdocnum: json["xdocnum"],
        xdate: json["xdate"],
        xcomm: json["xcomm"],
        xrem: json["xrem"],
        zactive: json["zactive"],
        xnote: json["xnote"],
        xretqty: json["xretqty"],
        xstatusgl: json["xstatusgl"],
        xdiscamt: json["xdiscamt"],
        xtransportamt: json["xtransportamt"],
        xqty: json["xqty"],
        xunitsel: json["xunitsel"],
        xserialnum: json["xserialnum"],
        xwperiod: json["xwperiod"],
        xwperiodtype: json["xwperiodtype"],
        xporate: json["xporate"],
        xref: json["xref"],
        xdisc: json["xdisc"],
        xbonuspoints: json["xbonuspoints"],
        xparentitem: json["xparentitem"],
        xrategrn: json["xrategrn"],
        xratesys: json["xratesys"],
        xsupptaxrate: json["xsupptaxrate"],
        xsupptaxamt: json["xsupptaxamt"],
        xserial: json["xserial"],
        xdateeff: json["xdateeff"],
        xdateexp: json["xdateexp"],
        xtornum: json["xtornum"],
        xavail: json["xavail"],
      );

  Map<String, dynamic> toJson() => {
        "descr": descr,
        "unit": unit,
        "ztime": ztime.toJson(),
        "zutime": zutime,
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "zid": zid,
        "zemail": zemail,
        "xdornum": xdornum,
        "xrow": xrow,
        "xitem": xitem,
        "xlong": xlong,
        "xvatrate": xvatrate,
        "xvatamt": xvatamt,
        "xqtyord": xqtyord,
        "xunit": xunit,
        "xrate": xrate,
        "xlineamt": xlineamt,
        "xchallanitem": xchallanitem,
        "xqtybonus": xqtybonus,
        "xpricerow": xpricerow,
        "xdiscdet": xdiscdet,
        "xdiscdetamt": xdiscdetamt,
        "xdoctype": xdoctype,
        "xcost": xcost,
        "xqtytr": xqtytr,
        "xpacking": xpacking,
        "xqtycrn": xqtycrn,
        "xdisctype": xdisctype,
        "xsprate": xsprate,
        "xnetamt": xnetamt,
        "xqtybntr": xqtybntr,
        "xdiscdetamttr": xdiscdetamttr,
        "xvatamttr": xvatamttr,
        "xnetamttr": xnetamttr,
        "xdiscstatus": xdiscstatus,
        "xbnprintstatus": xbnprintstatus,
        "xdocrow": xdocrow,
        "xdorrow": xdorrow,
        "xgcost": xgcost,
        "xdocnum": xdocnum,
        "xdate": xdate,
        "xcomm": xcomm,
        "xrem": xrem,
        "zactive": zactive,
        "xnote": xnote,
        "xretqty": xretqty,
        "xstatusgl": xstatusgl,
        "xdiscamt": xdiscamt,
        "xtransportamt": xtransportamt,
        "xqty": xqty,
        "xunitsel": xunitsel,
        "xserialnum": xserialnum,
        "xwperiod": xwperiod,
        "xwperiodtype": xwperiodtype,
        "xporate": xporate,
        "xref": xref,
        "xdisc": xdisc,
        "xbonuspoints": xbonuspoints,
        "xparentitem": xparentitem,
        "xrategrn": xrategrn,
        "xratesys": xratesys,
        "xsupptaxrate": xsupptaxrate,
        "xsupptaxamt": xsupptaxamt,
        "xserial": xserial,
        "xdateeff": xdateeff,
        "xdateexp": xdateexp,
        "xtornum": xtornum,
        "xavail": xavail,
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
