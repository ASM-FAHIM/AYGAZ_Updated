// To parse this JSON data, do
//
//     final pendingVoucherDetailsModel = pendingVoucherDetailsModelFromJson(jsonString);

import 'dart:convert';

List<PendingVoucherDetailsModel> pendingVoucherDetailsModelFromJson(
        String str) =>
    List<PendingVoucherDetailsModel>.from(
        json.decode(str).map((x) => PendingVoucherDetailsModel.fromJson(x)));

String pendingVoucherDetailsModelToJson(
        List<PendingVoucherDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingVoucherDetailsModel {
  PendingVoucherDetailsModel({
    required this.descr,
    required this.subdesc,
    required this.costcenter,
    required this.businesscenter,
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xvoucher,
    required this.xrow,
    required this.xacc,
    required this.xprime,
    required this.xlong,
    required this.xsub,
    required this.xwh,
    required this.xdeptname,
    required this.xinvnum,
    required this.xdebit,
    required this.xcredit,
    required this.xoldsub,
    required this.xoldsubdesc,
    required this.xaccusage,
    required this.xaccold,
    required this.xtype,
    required this.xtrn,
    required this.xregi,
    required this.xstaff,
    required this.xcountry,
    required this.xfairexp,
    required this.xaccolddesc,
    required this.xchequeno,
    required this.xdatechq,
    required this.xbank,
    required this.xpaidto,
    required this.xlcno,
    required this.xlocation,
    required this.xcostcenter,
    required this.xprofitcntrcat,
    required this.xprofitcntr,
  });

  dynamic descr;
  dynamic subdesc;
  dynamic costcenter;
  dynamic businesscenter;
  Ztime ztime;
  dynamic zutime;
  dynamic zauserid;
  dynamic zuuserid;
  int zid;
  dynamic xvoucher;
  int xrow;
  dynamic xacc;
  dynamic xprime;
  dynamic xlong;
  dynamic xsub;
  dynamic xwh;
  dynamic xdeptname;
  dynamic xinvnum;
  dynamic xdebit;
  dynamic xcredit;
  dynamic xoldsub;
  dynamic xoldsubdesc;
  dynamic xaccusage;
  dynamic xaccold;
  dynamic xtype;
  dynamic xtrn;
  dynamic xregi;
  dynamic xstaff;
  dynamic xcountry;
  dynamic xfairexp;
  dynamic xaccolddesc;
  dynamic xchequeno;
  dynamic xdatechq;
  dynamic xbank;
  dynamic xpaidto;
  dynamic xlcno;
  dynamic xlocation;
  dynamic xcostcenter;
  dynamic xprofitcntrcat;
  dynamic xprofitcntr;

  factory PendingVoucherDetailsModel.fromJson(Map<String, dynamic> json) =>
      PendingVoucherDetailsModel(
        descr: json["descr"],
        subdesc: json["subdesc"] == null ? null : json["subdesc"],
        costcenter: json["costcenter"],
        businesscenter: json["businesscenter"],
        ztime: Ztime.fromJson(json["ztime"]),
        zutime: json["zutime"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        zid: json["zid"],
        xvoucher: json["xvoucher"],
        xrow: json["xrow"],
        xacc: json["xacc"],
        xprime: json["xprime"],
        xlong: json["xlong"],
        xsub: json["xsub"],
        xwh: json["xwh"],
        xdeptname: json["xdeptname"],
        xinvnum: json["xinvnum"],
        xdebit: json["xdebit"],
        xcredit: json["xcredit"],
        xoldsub: json["xoldsub"],
        xoldsubdesc: json["xoldsubdesc"],
        xaccusage: json["xaccusage"],
        xaccold: json["xaccold"],
        xtype: json["xtype"],
        xtrn: json["xtrn"],
        xregi: json["xregi"],
        xstaff: json["xstaff"],
        xcountry: json["xcountry"],
        xfairexp: json["xfairexp"],
        xaccolddesc: json["xaccolddesc"],
        xchequeno: json["xchequeno"],
        xdatechq: json["xdatechq"],
        xbank: json["xbank"],
        xpaidto: json["xpaidto"],
        xlcno: json["xlcno"],
        xlocation: json["xlocation"],
        xcostcenter: json["xcostcenter"],
        xprofitcntrcat: json["xprofitcntrcat"],
        xprofitcntr: json["xprofitcntr"],
      );

  Map<String, dynamic> toJson() => {
        "descr": descr,
        "subdesc": subdesc == null ? null : subdesc,
        "costcenter": costcenter,
        "businesscenter": businesscenter,
        "ztime": ztime.toJson(),
        "zutime": zutime,
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "zid": zid,
        "xvoucher": xvoucher,
        "xrow": xrow,
        "xacc": xacc,
        "xprime": xprime,
        "xlong": xlong,
        "xsub": xsub,
        "xwh": xwh,
        "xdeptname": xdeptname,
        "xinvnum": xinvnum,
        "xdebit": xdebit,
        "xcredit": xcredit,
        "xoldsub": xoldsub,
        "xoldsubdesc": xoldsubdesc,
        "xaccusage": xaccusage,
        "xaccold": xaccold,
        "xtype": xtype,
        "xtrn": xtrn,
        "xregi": xregi,
        "xstaff": xstaff,
        "xcountry": xcountry,
        "xfairexp": xfairexp,
        "xaccolddesc": xaccolddesc,
        "xchequeno": xchequeno,
        "xdatechq": xdatechq,
        "xbank": xbank,
        "xpaidto": xpaidto,
        "xlcno": xlcno,
        "xlocation": xlocation,
        "xcostcenter": xcostcenter,
        "xprofitcntrcat": xprofitcntrcat,
        "xprofitcntr": xprofitcntr,
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
