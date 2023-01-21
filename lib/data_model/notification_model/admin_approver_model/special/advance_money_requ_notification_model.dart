// To parse this JSON data, do
//
//     final advanceMoneyRequNotiModel = advanceMoneyRequNotiModelFromJson(jsonString);

import 'dart:convert';

List<AdvanceMoneyRequNotiModel> advanceMoneyRequNotiModelFromJson(String str) => List<AdvanceMoneyRequNotiModel>.from(json.decode(str).map((x) => AdvanceMoneyRequNotiModel.fromJson(x)));

String advanceMoneyRequNotiModelToJson(List<AdvanceMoneyRequNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvanceMoneyRequNotiModel {
  AdvanceMoneyRequNotiModel({
    required this.acreqnum,
    required this.zid,
    required this.xdate,
    required this.xstatusreq,
    required this.ztime,
    //required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.xacreqnum,
    required this.xnote,
    required this.xdeptname,
    required this.xwh,
    required this.xfwh,
    required this.xtwh,
    required this.xtype,
    required this.xstatus,
    required this.xvoucher,
    required this.xstatusap,
    required this.xregi,
    required this.xsuperiorsp,
    required this.xstaff,
    required this.xbank,
    required this.xadjustment,
    required this.xstype,
    required this.xdatereq,
    required this.xprime,
    required this.xadvnum,
    required this.xpreparer,
    required this.xsignatory1,
    //required this.xsigndate1,
    required this.xsignatory2,
    //required this.xsigndate2,
    required this.xsignatory3,
    //required this.xsigndate3,
    required this.xsignatory4,
    //required this.xsigndate4,
    required this.xsignatory5,
    //required this.xsigndate5,
    required this.xsignatory6,
    //required this.xsigndate6,
    required this.xsignatory7,
    //required this.xsigndate7,
    required this.xsuperior2,
    required this.xsuperior3,
    required this.xsignreject,
    required this.xdatereject,
    required this.xnote1,
    required this.xpaymenttype,
    required this.xchargetype,
    required this.xidsup,
    required this.xproject,
    required this.xdesc,
    required this.xcompany,
    required this.xref,
    required this.xdateret,
    required this.xpornum,
    required this.xacccr,
    required this.xaccdr,
    required this.xpaymentterm,
    required this.xchequeno,
    required this.xdatechq,
    required this.xdategl,
    required this.xnote2,
    required this.xempunit,
    required this.name,
  });

  dynamic acreqnum;
  int zid;
  Xdate xdate;
  dynamic xstatusreq;
  Xdate ztime;
  //Xdate zutime;
  dynamic zauserid;
  dynamic zuuserid;
  dynamic xacreqnum;
  dynamic xnote;
  dynamic xdeptname;
  dynamic xwh;
  dynamic xfwh;
  dynamic xtwh;
  dynamic xtype;
  dynamic xstatus;
  dynamic xvoucher;
  dynamic xstatusap;
  dynamic xregi;
  dynamic xsuperiorsp;
  dynamic xstaff;
  dynamic xbank;
  dynamic xadjustment;
  dynamic xstype;
  dynamic xdatereq;
  dynamic xprime;
  dynamic xadvnum;
  dynamic xpreparer;
  dynamic xsignatory1;
  //Xdate xsigndate1;
  dynamic xsignatory2;
  //Xdate xsigndate2;
  dynamic xsignatory3;
  //dynamic xsigndate3;
  dynamic xsignatory4;
  //dynamic xsigndate4;
  dynamic xsignatory5;
  //dynamic xsigndate5;
  dynamic xsignatory6;
  //dynamic xsigndate6;
  dynamic xsignatory7;
  //dynamic xsigndate7;
  dynamic xsuperior2;
  dynamic xsuperior3;
  dynamic xsignreject;
  dynamic xdatereject;
  dynamic xnote1;
  dynamic xpaymenttype;
  dynamic xchargetype;
  dynamic xidsup;
  dynamic xproject;
  dynamic xdesc;
  dynamic xcompany;
  dynamic xref;
  dynamic xdateret;
  dynamic xpornum;
  dynamic xacccr;
  dynamic xaccdr;
  dynamic xpaymentterm;
  dynamic xchequeno;
  dynamic xdatechq;
  dynamic xdategl;
  dynamic xnote2;
  dynamic xempunit;
  dynamic name;

  factory AdvanceMoneyRequNotiModel.fromJson(Map<String, dynamic> json) => AdvanceMoneyRequNotiModel(
    acreqnum: json["acreqnum"],
    zid: json["zid"],
    xdate: Xdate.fromJson(json["xdate"]),
    xstatusreq: json["xstatusreq"],
    ztime: Xdate.fromJson(json["ztime"]),
    //zutime: Xdate.fromJson(json["zutime"]),
    zauserid: json["zauserid"],
    zuuserid: json["zuuserid"],
    xacreqnum: json["xacreqnum"],
    xnote: json["xnote"],
    xdeptname: json["xdeptname"],
    xwh: json["xwh"],
    xfwh: json["xfwh"],
    xtwh: json["xtwh"],
    xtype: json["xtype"],
    xstatus: json["xstatus"],
    xvoucher: json["xvoucher"],
    xstatusap: json["xstatusap"],
    xregi: json["xregi"],
    xsuperiorsp: json["xsuperiorsp"],
    xstaff: json["xstaff"],
    xbank: json["xbank"],
    xadjustment: json["xadjustment"],
    xstype: json["xstype"],
    xdatereq: json["xdatereq"],
    xprime: json["xprime"],
    xadvnum: json["xadvnum"],
    xpreparer: json["xpreparer"],
    xsignatory1: json["xsignatory1"],
    //xsigndate1: Xdate.fromJson(json["xsigndate1"]),
    xsignatory2: json["xsignatory2"],
    //xsigndate2: Xdate.fromJson(json["xsigndate2"]),
    xsignatory3: json["xsignatory3"],
    //xsigndate3: json["xsigndate3"],
    xsignatory4: json["xsignatory4"],
   // xsigndate4: json["xsigndate4"],
    xsignatory5: json["xsignatory5"],
    //xsigndate5: json["xsigndate5"],
    xsignatory6: json["xsignatory6"],
    //xsigndate6: json["xsigndate6"],
    xsignatory7: json["xsignatory7"],
    //xsigndate7: json["xsigndate7"],
    xsuperior2: json["xsuperior2"],
    xsuperior3: json["xsuperior3"],
    xsignreject: json["xsignreject"],
    xdatereject: json["xdatereject"],
    xnote1: json["xnote1"],
    xpaymenttype: json["xpaymenttype"],
    xchargetype: json["xchargetype"],
    xidsup: json["xidsup"],
    xproject: json["xproject"],
    xdesc: json["xdesc"],
    xcompany: json["xcompany"],
    xref: json["xref"],
    xdateret: json["xdateret"],
    xpornum: json["xpornum"],
    xacccr: json["xacccr"],
    xaccdr: json["xaccdr"],
    xpaymentterm: json["xpaymentterm"],
    xchequeno: json["xchequeno"],
    xdatechq: json["xdatechq"],
    xdategl: json["xdategl"],
    xnote2: json["xnote2"],
    xempunit: json["xempunit"],
    name: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "acreqnum": acreqnum,
    "zid": zid,
    "xdate": xdate.toJson(),
    "xstatusreq": xstatusreq,
    "ztime": ztime.toJson(),
    //"zutime": zutime.toJson(),
    "zauserid": zauserid,
    "zuuserid": zuuserid,
    "xacreqnum": xacreqnum,
    "xnote": xnote,
    "xdeptname": xdeptname,
    "xwh": xwh,
    "xfwh": xfwh,
    "xtwh": xtwh,
    "xtype": xtype,
    "xstatus": xstatus,
    "xvoucher": xvoucher,
    "xstatusap": xstatusap,
    "xregi": xregi,
    "xsuperiorsp": xsuperiorsp,
    "xstaff": xstaff,
    "xbank": xbank,
    "xadjustment": xadjustment,
    "xstype": xstype,
    "xdatereq": xdatereq,
    "xprime": xprime,
    "xadvnum": xadvnum,
    "xpreparer": xpreparer,
    "xsignatory1": xsignatory1,
    //"xsigndate1": xsigndate1.toJson(),
    "xsignatory2": xsignatory2,
    //"xsigndate2": xsigndate2.toJson(),
    "xsignatory3": xsignatory3,
    //"xsigndate3": xsigndate3,
    "xsignatory4": xsignatory4,
    //"xsigndate4": xsigndate4,
    "xsignatory5": xsignatory5,
    //"xsigndate5": xsigndate5,
    "xsignatory6": xsignatory6,
    //"xsigndate6": xsigndate6,
    "xsignatory7": xsignatory7,
    //"xsigndate7": xsigndate7,
    "xsuperior2": xsuperior2,
    "xsuperior3": xsuperior3,
    "xsignreject": xsignreject,
    "xdatereject": xdatereject,
    "xnote1": xnote1,
    "xpaymenttype": xpaymenttype,
    "xchargetype": xchargetype,
    "xidsup": xidsup,
    "xproject": xproject,
    "xdesc": xdesc,
    "xcompany": xcompany,
    "xref": xref,
    "xdateret": xdateret,
    "xpornum": xpornum,
    "xacccr": xacccr,
    "xaccdr": xaccdr,
    "xpaymentterm": xpaymentterm,
    "xchequeno": xchequeno,
    "xdatechq": xdatechq,
    "xdategl": xdategl,
    "xnote2": xnote2,
    "xempunit": xempunit,
    "name": name,
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
