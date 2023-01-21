// To parse this JSON data, do
//
//     final grnDetailsModel = grnDetailsModelFromJson(jsonString);

import 'dart:convert';

List<GrnDetailsModel> grnDetailsModelFromJson(String str) =>
    List<GrnDetailsModel>.from(
        json.decode(str).map((x) => GrnDetailsModel.fromJson(x)));

String grnDetailsModelToJson(List<GrnDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GrnDetailsModel {
  GrnDetailsModel({
    required this.descr,
    required this.partno,
    required this.mismatch,
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xgrnnum,
    required this.xrow,
    required this.xitem,
    required this.xdesc,
    required this.xqtygrn,
    required this.xunitpur,
    required this.xrate,
    required this.xlong,
    required this.xlineamt,
    required this.xbatch,
    required this.xdateexp,
    required this.xdisc,
    required this.xdiscf,
    required this.xdocrow,
    required this.xcfpur,
    required this.xvatrate,
    required this.xvatamt,
    required this.xqtybonus,
    required this.xpornum,
    required this.xtype,
    required this.xdategl,
    required this.xrategrn,
    required this.xlot,
    required this.xcottontype,
    required this.xserial,
    required this.xttamount,
    required this.xbase,
    required this.xttbase,
    required this.xbuyeramt,
    required this.xprimebuyer,
    required this.xttbuyer,
    required this.xqtycom,
    required this.xstatusimgl,
    required this.xmodel,
    required this.xprodyear,
    required this.xengineno,
    required this.xqtyinsp,
    required this.xvalpo,
    required this.xqtyprn,
    required this.xqtyrec,
    required this.xqtyclaim,
    required this.xbinref,
    required this.xcdrate,
    required this.xcdamt,
    required this.xrdrate,
    required this.xrdamt,
    required this.xsupptaxrate,
    required this.xsupptaxamt,
    required this.xait,
    required this.xaitamt,
    required this.xatrate,
    required this.xatamt,
    required this.xqtygain,
    required this.xplot,
  });

  dynamic descr;
  dynamic partno;
  dynamic mismatch;
  Ztime ztime;
  dynamic zutime;
  dynamic zauserid;
  dynamic zuuserid;
  int zid;
  dynamic xgrnnum;
  int xrow;
  dynamic xitem;
  dynamic xdesc;
  dynamic xqtygrn;
  dynamic xunitpur;
  dynamic xrate;
  dynamic xlong;
  dynamic xlineamt;
  dynamic xbatch;
  dynamic xdateexp;
  dynamic xdisc;
  dynamic xdiscf;
  int xdocrow;
  dynamic xcfpur;
  dynamic xvatrate;
  dynamic xvatamt;
  dynamic xqtybonus;
  dynamic xpornum;
  dynamic xtype;
  dynamic xdategl;
  dynamic xrategrn;
  dynamic xlot;
  dynamic xcottontype;
  dynamic xserial;
  dynamic xttamount;
  dynamic xbase;
  dynamic xttbase;
  dynamic xbuyeramt;
  dynamic xprimebuyer;
  dynamic xttbuyer;
  dynamic xqtycom;
  dynamic xstatusimgl;
  dynamic xmodel;
  dynamic xprodyear;
  dynamic xengineno;
  dynamic xqtyinsp;
  dynamic xvalpo;
  dynamic xqtyprn;
  dynamic xqtyrec;
  dynamic xqtyclaim;
  dynamic xbinref;
  dynamic xcdrate;
  dynamic xcdamt;
  dynamic xrdrate;
  dynamic xrdamt;
  dynamic xsupptaxrate;
  dynamic xsupptaxamt;
  dynamic xait;
  dynamic xaitamt;
  dynamic xatrate;
  dynamic xatamt;
  dynamic xqtygain;
  dynamic xplot;

  factory GrnDetailsModel.fromJson(Map<String, dynamic> json) =>
      GrnDetailsModel(
        descr: json["descr"],
        partno: json["partno"],
        mismatch: json["mismatch"],
        ztime: Ztime.fromJson(json["ztime"]),
        zutime: json["zutime"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        zid: json["zid"],
        xgrnnum: json["xgrnnum"],
        xrow: json["xrow"],
        xitem: json["xitem"],
        xdesc: json["xdesc"],
        xqtygrn: json["xqtygrn"],
        xunitpur: json["xunitpur"],
        xrate: json["xrate"],
        xlong: json["xlong"],
        xlineamt: json["xlineamt"],
        xbatch: json["xbatch"],
        xdateexp: json["xdateexp"],
        xdisc: json["xdisc"],
        xdiscf: json["xdiscf"],
        xdocrow: json["xdocrow"],
        xcfpur: json["xcfpur"],
        xvatrate: json["xvatrate"],
        xvatamt: json["xvatamt"],
        xqtybonus: json["xqtybonus"],
        xpornum: json["xpornum"],
        xtype: json["xtype"],
        xdategl: json["xdategl"],
        xrategrn: json["xrategrn"],
        xlot: json["xlot"],
        xcottontype: json["xcottontype"],
        xserial: json["xserial"],
        xttamount: json["xttamount"],
        xbase: json["xbase"],
        xttbase: json["xttbase"],
        xbuyeramt: json["xbuyeramt"],
        xprimebuyer: json["xprimebuyer"],
        xttbuyer: json["xttbuyer"],
        xqtycom: json["xqtycom"],
        xstatusimgl: json["xstatusimgl"],
        xmodel: json["xmodel"],
        xprodyear: json["xprodyear"],
        xengineno: json["xengineno"],
        xqtyinsp: json["xqtyinsp"],
        xvalpo: json["xvalpo"],
        xqtyprn: json["xqtyprn"],
        xqtyrec: json["xqtyrec"],
        xqtyclaim: json["xqtyclaim"],
        xbinref: json["xbinref"],
        xcdrate: json["xcdrate"],
        xcdamt: json["xcdamt"],
        xrdrate: json["xrdrate"],
        xrdamt: json["xrdamt"],
        xsupptaxrate: json["xsupptaxrate"],
        xsupptaxamt: json["xsupptaxamt"],
        xait: json["xait"],
        xaitamt: json["xaitamt"],
        xatrate: json["xatrate"],
        xatamt: json["xatamt"],
        xqtygain: json["xqtygain"],
        xplot: json["xplot"],
      );

  Map<String, dynamic> toJson() => {
        "descr": descr,
        "partno": partno,
        "mismatch": mismatch,
        "ztime": ztime.toJson(),
        "zutime": zutime,
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "zid": zid,
        "xgrnnum": xgrnnum,
        "xrow": xrow,
        "xitem": xitem,
        "xdesc": xdesc,
        "xqtygrn": xqtygrn,
        "xunitpur": xunitpur,
        "xrate": xrate,
        "xlong": xlong,
        "xlineamt": xlineamt,
        "xbatch": xbatch,
        "xdateexp": xdateexp,
        "xdisc": xdisc,
        "xdiscf": xdiscf,
        "xdocrow": xdocrow,
        "xcfpur": xcfpur,
        "xvatrate": xvatrate,
        "xvatamt": xvatamt,
        "xqtybonus": xqtybonus,
        "xpornum": xpornum,
        "xtype": xtype,
        "xdategl": xdategl,
        "xrategrn": xrategrn,
        "xlot": xlot,
        "xcottontype": xcottontype,
        "xserial": xserial,
        "xttamount": xttamount,
        "xbase": xbase,
        "xttbase": xttbase,
        "xbuyeramt": xbuyeramt,
        "xprimebuyer": xprimebuyer,
        "xttbuyer": xttbuyer,
        "xqtycom": xqtycom,
        "xstatusimgl": xstatusimgl,
        "xmodel": xmodel,
        "xprodyear": xprodyear,
        "xengineno": xengineno,
        "xqtyinsp": xqtyinsp,
        "xvalpo": xvalpo,
        "xqtyprn": xqtyprn,
        "xqtyrec": xqtyrec,
        "xqtyclaim": xqtyclaim,
        "xbinref": xbinref,
        "xcdrate": xcdrate,
        "xcdamt": xcdamt,
        "xrdrate": xrdrate,
        "xrdamt": xrdamt,
        "xsupptaxrate": xsupptaxrate,
        "xsupptaxamt": xsupptaxamt,
        "xait": xait,
        "xaitamt": xaitamt,
        "xatrate": xatrate,
        "xatamt": xatamt,
        "xqtygain": xqtygain,
        "xplot": xplot,
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
