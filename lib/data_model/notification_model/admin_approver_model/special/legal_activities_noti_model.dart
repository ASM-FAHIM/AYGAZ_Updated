// // To parse this JSON data, do
// //
// //     final legalActivitiesNotiModel = legalActivitiesNotiModelFromJson(jsondynamic);
//
// import 'dart:convert';
//
// List<LegalActivitiesNotiModel> legalActivitiesNotiModelFromJson(dynamic str) => List<LegalActivitiesNotiModel>.from(json.decode(str).map((x) => LegalActivitiesNotiModel.fromJson(x)));
//
// dynamic legalActivitiesNotiModelToJson(List<LegalActivitiesNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class LegalActivitiesNotiModel {
//   LegalActivitiesNotiModel({
//     required required this.reqnum,
//     required required this.xdate,
//     required required this.xref,
//     required required this.xstatus,
//     required required this.ztime,
//     required required this.zutime,
//     required required this.zauserid,
//     required required this.zuuserid,
//     required required this.zid,
//     required required this.xacreqnum,
//     required required this.xstatusreq,
//     required required this.xnote,
//     required required this.xdeptname,
//     required required this.xwh,
//     required required this.xfwh,
//     required required this.xtwh,
//     required required this.xtype,
//     required required this.xvoucher,
//     required required this.xstatusap,
//     required required this.xregi,
//     required required this.xsuperiorsp,
//     required required this.xstaff,
//     required required this.xbank,
//     required required this.xadjustment,
//     required required this.xstype,
//     required required this.xdatereq,
//     required required this.xprime,
//     required required this.xadvnum,
//     required required this.xpreparer,
//     required required this.xsignatory1,
//     required required this.xsigndate1,
//     required required this.xsignatory2,
//     required required this.xsigndate2,
//     required required this.xsignatory3,
//     required required this.xsigndate3,
//     required required this.xsignatory4,
//     required required this.xsigndate4,
//     required required this.xsignatory5,
//     required required this.xsigndate5,
//     required required this.xsignatory6,
//     required required this.xsigndate6,
//     required required this.xsignatory7,
//     required required this.xsigndate7,
//     required required this.xsuperior2,
//     required required this.xsuperior3,
//     required required this.xsignreject,
//     required required this.xdatereject,
//     required required this.xnote1,
//     required required this.xpaymenttype,
//     required required this.xchargetype,
//     required required this.xidsup,
//     required required this.xproject,
//     required required this.xdesc,
//     required required this.xcompany,
//     required required this.xdateret,
//     required required this.xpornum,
//     required required this.xacccr,
//     required required this.xaccdr,
//     required required this.xpaymentterm,
//     required required this.xchequeno,
//     required required this.xdatechq,
//     required required this.xdategl,
//     required required this.xnote2,
//     required required this.xempunit,
//   });
//
//   dynamic reqnum;
//   Xdate xdate;
//   dynamic xref;
//   dynamic xstatus;
//   Xdate ztime;
//   dynamic zutime;
//   dynamic zauserid;
//   dynamic zuuserid;
//   int zid;
//   dynamic xacreqnum;
//   dynamic xstatusreq;
//   dynamic xnote;
//   dynamic xdeptname;
//   dynamic xwh;
//   dynamic xfwh;
//   dynamic xtwh;
//   dynamic xtype;
//   dynamic xvoucher;
//   dynamic xstatusap;
//   dynamic xregi;
//   dynamic xsuperiorsp;
//   dynamic xstaff;
//   dynamic xbank;
//   dynamic xadjustment;
//   dynamic xstype;
//   dynamic xdatereq;
//   dynamic xprime;
//   dynamic xadvnum;
//   dynamic xpreparer;
//   dynamic xsignatory1;
//   Xdate xsigndate1;
//   dynamic xsignatory2;
//   Xdate xsigndate2;
//   dynamic xsignatory3;
//   dynamic xsigndate3;
//   dynamic xsignatory4;
//   dynamic xsigndate4;
//   dynamic xsignatory5;
//   dynamic xsigndate5;
//   dynamic xsignatory6;
//   dynamic xsigndate6;
//   dynamic xsignatory7;
//   dynamic xsigndate7;
//   dynamic xsuperior2;
//   dynamic xsuperior3;
//   dynamic xsignreject;
//   dynamic xdatereject;
//   dynamic xnote1;
//   dynamic xpaymenttype;
//   dynamic xchargetype;
//   dynamic xidsup;
//   dynamic xproject;
//   dynamic xdesc;
//   dynamic xcompany;
//   Xdate xdateret;
//   dynamic xpornum;
//   dynamic xacccr;
//   dynamic xaccdr;
//   dynamic xpaymentterm;
//   dynamic xchequeno;
//   dynamic xdatechq;
//   dynamic xdategl;
//   dynamic xnote2;
//   dynamic xempunit;
//
//   factory LegalActivitiesNotiModel.fromJson(Map<dynamic, dynamic> json) => LegalActivitiesNotiModel(
//     reqnum: json["reqnum"],
//     xdate: Xdate.fromJson(json["xdate"]),
//     xref: json["xref"],
//     xstatus: json["xstatus"],
//     ztime: Xdate.fromJson(json["ztime"]),
//     zutime: json["zutime"],
//     zauserid: json["zauserid"],
//     zuuserid: json["zuuserid"],
//     zid: json["zid"],
//     xacreqnum: json["xacreqnum"],
//     xstatusreq: json["xstatusreq"],
//     xnote: json["xnote"],
//     xdeptname: json["xdeptname"],
//     xwh: json["xwh"],
//     xfwh: json["xfwh"],
//     xtwh: json["xtwh"],
//     xtype: json["xtype"],
//     xvoucher: json["xvoucher"],
//     xstatusap: json["xstatusap"],
//     xregi: json["xregi"],
//     xsuperiorsp: json["xsuperiorsp"],
//     xstaff: json["xstaff"],
//     xbank: json["xbank"],
//     xadjustment: json["xadjustment"],
//     xstype: json["xstype"],
//     xdatereq: json["xdatereq"],
//     xprime: json["xprime"],
//     xadvnum: json["xadvnum"],
//     xpreparer: json["xpreparer"],
//     xsignatory1: json["xsignatory1"],
//     xsigndate1: Xdate.fromJson(json["xsigndate1"]),
//     xsignatory2: json["xsignatory2"],
//     xsigndate2: Xdate.fromJson(json["xsigndate2"]),
//     xsignatory3: json["xsignatory3"],
//     xsigndate3: json["xsigndate3"],
//     xsignatory4: json["xsignatory4"],
//     xsigndate4: json["xsigndate4"],
//     xsignatory5: json["xsignatory5"],
//     xsigndate5: json["xsigndate5"],
//     xsignatory6: json["xsignatory6"],
//     xsigndate6: json["xsigndate6"],
//     xsignatory7: json["xsignatory7"],
//     xsigndate7: json["xsigndate7"],
//     xsuperior2: json["xsuperior2"],
//     xsuperior3: json["xsuperior3"],
//     xsignreject: json["xsignreject"],
//     xdatereject: json["xdatereject"],
//     xnote1: json["xnote1"],
//     xpaymenttype: json["xpaymenttype"],
//     xchargetype: json["xchargetype"],
//     xidsup: json["xidsup"],
//     xproject: json["xproject"],
//     xdesc: json["xdesc"],
//     xcompany: json["xcompany"],
//     xdateret: Xdate.fromJson(json["xdateret"]),
//     xpornum: json["xpornum"],
//     xacccr: json["xacccr"],
//     xaccdr: json["xaccdr"],
//     xpaymentterm: json["xpaymentterm"],
//     xchequeno: json["xchequeno"],
//     xdatechq: json["xdatechq"],
//     xdategl: json["xdategl"],
//     xnote2: json["xnote2"],
//     xempunit: json["xempunit"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "reqnum": reqnum,
//     "xdate": xdate.toJson(),
//     "xref": xref,
//     "xstatus": xstatus,
//     "ztime": ztime.toJson(),
//     "zutime": zutime,
//     "zauserid": zauserid,
//     "zuuserid": zuuserid,
//     "zid": zid,
//     "xacreqnum": xacreqnum,
//     "xstatusreq": xstatusreq,
//     "xnote": xnote,
//     "xdeptname": xdeptname,
//     "xwh": xwh,
//     "xfwh": xfwh,
//     "xtwh": xtwh,
//     "xtype": xtype,
//     "xvoucher": xvoucher,
//     "xstatusap": xstatusap,
//     "xregi": xregi,
//     "xsuperiorsp": xsuperiorsp,
//     "xstaff": xstaff,
//     "xbank": xbank,
//     "xadjustment": xadjustment,
//     "xstype": xstype,
//     "xdatereq": xdatereq,
//     "xprime": xprime,
//     "xadvnum": xadvnum,
//     "xpreparer": xpreparer,
//     "xsignatory1": xsignatory1,
//     "xsigndate1": xsigndate1.toJson(),
//     "xsignatory2": xsignatory2,
//     "xsigndate2": xsigndate2.toJson(),
//     "xsignatory3": xsignatory3,
//     "xsigndate3": xsigndate3,
//     "xsignatory4": xsignatory4,
//     "xsigndate4": xsigndate4,
//     "xsignatory5": xsignatory5,
//     "xsigndate5": xsigndate5,
//     "xsignatory6": xsignatory6,
//     "xsigndate6": xsigndate6,
//     "xsignatory7": xsignatory7,
//     "xsigndate7": xsigndate7,
//     "xsuperior2": xsuperior2,
//     "xsuperior3": xsuperior3,
//     "xsignreject": xsignreject,
//     "xdatereject": xdatereject,
//     "xnote1": xnote1,
//     "xpaymenttype": xpaymenttype,
//     "xchargetype": xchargetype,
//     "xidsup": xidsup,
//     "xproject": xproject,
//     "xdesc": xdesc,
//     "xcompany": xcompany,
//     "xdateret": xdateret.toJson(),
//     "xpornum": xpornum,
//     "xacccr": xacccr,
//     "xaccdr": xaccdr,
//     "xpaymentterm": xpaymentterm,
//     "xchequeno": xchequeno,
//     "xdatechq": xdatechq,
//     "xdategl": xdategl,
//     "xnote2": xnote2,
//     "xempunit": xempunit,
//   };
// }
//
// class Xdate {
//   Xdate({
//     required required this.date,
//     required required this.timezoneType,
//     required required this.timezone,
//   });
//
//   DateTime date;
//   int timezoneType;
//   String timezone;
//
//   factory Xdate.fromJson(Map<String, dynamic> json) => Xdate(
//     date: DateTime.parse(json["date"]),
//     timezoneType: json["timezone_type"],
//     timezone: json["timezone"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "date": date.toIso8601String(),
//     "timezone_type": timezoneType,
//     "timezone": timezone,
//   };
// }

// To parse this JSON data, do
//
//     final legalActivitiesNotiModel = legalActivitiesNotiModelFromJson(jsonString);

import 'dart:convert';

List<LegalActivitiesNotiModel> legalActivitiesNotiModelFromJson(String str) => List<LegalActivitiesNotiModel>.from(json.decode(str).map((x) => LegalActivitiesNotiModel.fromJson(x)));

String legalActivitiesNotiModelToJson(List<LegalActivitiesNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LegalActivitiesNotiModel {
  LegalActivitiesNotiModel({
    required this.reqnum,
    required this.xdate,
    required this.xref,
    required this.xstatus,
    required this.amount,
    required this.xnote,
    required this.xcompany,
    required this.name,
    required this.xdesc,
  });

  dynamic reqnum;
  Xdate xdate;
  dynamic xref;
  dynamic xstatus;
  dynamic amount;
  dynamic xnote;
  dynamic xcompany;
  dynamic name;
  dynamic xdesc;

  factory LegalActivitiesNotiModel.fromJson(Map<String, dynamic> json) => LegalActivitiesNotiModel(
    reqnum: json["reqnum"],
    xdate: Xdate.fromJson(json["xdate"]),
    xref: json["xref"],
    xstatus: json["xstatus"],
    amount: json["amount"],
    xnote: json["xnote"],
    xcompany: json["xcompany"],
    name: json["name"], xdesc: json["xdesc"]
  );

  Map<String, dynamic> toJson() => {
    "reqnum": reqnum,
    "xdate": xdate.toJson(),
    "xref": xref,
    "xstatus": xstatus,
    "amount": amount,
    "xnote": xnote,
    "xcompany": xcompany,
    "name": name,
    "xdesc": xdesc,
  };
}

class Xdate {
  Xdate({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Xdate.fromJson(Map<String, dynamic> json) => Xdate(
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
