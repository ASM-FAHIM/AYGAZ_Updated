// To parse this JSON data, do
//
//     final dcAdminModel = dcAdminModelFromJson(jsonString);

import 'dart:convert';

List<DcAdminModel> dcAdminModelFromJson(String str) => List<DcAdminModel>.from(
    json.decode(str).map((x) => DcAdminModel.fromJson(x)));

String dcAdminModelToJson(List<DcAdminModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DcAdminModel {
  DcAdminModel({
    required this.orgname,
    required this.xcusname,
    required this.xtsoname,
    required this.asmname,
    required this.preparer,
    required this.deptname,
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xdocnum,
    required this.xdate,
    required this.xcus,
    required this.xstatusdoc,
    required this.xref,
    required this.xdornum,
    required this.xordernum,
    required this.xwh,
    required this.xnote,
    required this.xtype,
    required this.xstype,
    required this.xstatusdor,
    required this.xprime,
    required this.xterritory,
    required this.xvatamt,
    required this.xdatecom,
    required this.xtornum,
    required this.xfwh,
    required this.xtso,
    required this.xsp,
    required this.xsm,
    required this.xrsm,
    required this.xareaop,
    required this.xdivisionop,
    required this.xthanaop,
    required this.xdistrictop,
    required this.xsubcat,
    required this.xstatusar,
    required this.xstatusrec,
    required this.xtruckno,
    required this.xstatus,
    required this.xpreparer,
    required this.xsignatory1,
    required this.xsigndate1,
    required this.xsignatory2,
    required this.xsigndate2,
    required this.xsignatory3,
    required this.xsigndate3,
    required this.xsignatory4,
    required this.xsigndate4,
    required this.xsignatory5,
    required this.xsigndate5,
    required this.xsignatory6,
    required this.xsigndate6,
    required this.xsignatory7,
    required this.xsigndate7,
    required this.xidsup,
    required this.xsuperior2,
    required this.xsuperior3,
    required this.xsignreject,
    required this.xdatereject,
    required this.xnote1,
  });

  String orgname;
  String xcusname;
  String xtsoname;
  String asmname;
  String preparer;
  String deptname;
  Xdate ztime;
  Xdate zutime;
  String zauserid;
  String zuuserid;
  int zid;
  String xdocnum;
  Xdate xdate;
  String xcus;
  String xstatusdoc;
  String xref;
  String xdornum;
  String xordernum;
  dynamic xwh;
  String xnote;
  String xtype;
  String xstype;
  String xstatusdor;
  String xprime;
  String xterritory;
  String xvatamt;
  Xdate xdatecom;
  String xtornum;
  String xfwh;
  String xtso;
  String xsp;
  String xsm;
  String xrsm;
  String xareaop;
  String xdivisionop;
  String xthanaop;
  String xdistrictop;
  String xsubcat;
  dynamic xstatusar;
  dynamic xstatusrec;
  String xtruckno;
  String xstatus;
  String xpreparer;
  String xsignatory1;
  dynamic xsigndate1;
  String xsignatory2;
  dynamic xsigndate2;
  String xsignatory3;
  dynamic xsigndate3;
  String xsignatory4;
  dynamic xsigndate4;
  String xsignatory5;
  dynamic xsigndate5;
  dynamic xsignatory6;
  dynamic xsigndate6;
  dynamic xsignatory7;
  dynamic xsigndate7;
  String xidsup;
  String xsuperior2;
  String xsuperior3;
  String xsignreject;
  dynamic xdatereject;
  String xnote1;

  factory DcAdminModel.fromJson(Map<String, dynamic> json) => DcAdminModel(
        orgname: json["orgname"],
        xcusname: json["xcusname"],
        xtsoname: json["xtsoname"],
        asmname: json["asmname"],
        preparer: json["preparer"],
        deptname: json["deptname"],
        ztime: Xdate.fromJson(json["ztime"]),
        zutime: Xdate.fromJson(json["zutime"]),
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"],
        zid: json["zid"],
        xdocnum: json["xdocnum"],
        xdate: Xdate.fromJson(json["xdate"]),
        xcus: json["xcus"],
        xstatusdoc: json["xstatusdoc"],
        xref: json["xref"],
        xdornum: json["xdornum"],
        xordernum: json["xordernum"],
        xwh: json["xwh"],
        xnote: json["xnote"],
        xtype: json["xtype"],
        xstype: json["xstype"],
        xstatusdor: json["xstatusdor"],
        xprime: json["xprime"],
        xterritory: json["xterritory"],
        xvatamt: json["xvatamt"],
        xdatecom: Xdate.fromJson(json["xdatecom"]),
        xtornum: json["xtornum"],
        xfwh: json["xfwh"],
        xtso: json["xtso"],
        xsp: json["xsp"],
        xsm: json["xsm"],
        xrsm: json["xrsm"],
        xareaop: json["xareaop"],
        xdivisionop: json["xdivisionop"],
        xthanaop: json["xthanaop"],
        xdistrictop: json["xdistrictop"],
        xsubcat: json["xsubcat"],
        xstatusar: json["xstatusar"],
        xstatusrec: json["xstatusrec"],
        xtruckno: json["xtruckno"],
        xstatus: json["xstatus"],
        xpreparer: json["xpreparer"],
        xsignatory1: json["xsignatory1"],
        xsigndate1: json["xsigndate1"],
        xsignatory2: json["xsignatory2"],
        xsigndate2: json["xsigndate2"],
        xsignatory3: json["xsignatory3"],
        xsigndate3: json["xsigndate3"],
        xsignatory4: json["xsignatory4"],
        xsigndate4: json["xsigndate4"],
        xsignatory5: json["xsignatory5"],
        xsigndate5: json["xsigndate5"],
        xsignatory6: json["xsignatory6"],
        xsigndate6: json["xsigndate6"],
        xsignatory7: json["xsignatory7"],
        xsigndate7: json["xsigndate7"],
        xidsup: json["xidsup"],
        xsuperior2: json["xsuperior2"],
        xsuperior3: json["xsuperior3"],
        xsignreject: json["xsignreject"],
        xdatereject: json["xdatereject"],
        xnote1: json["xnote1"],
      );

  Map<String, dynamic> toJson() => {
        "orgname": orgname,
        "xcusname": xcusname,
        "xtsoname": xtsoname,
        "asmname": asmname,
        "preparer": preparer,
        "deptname": deptname,
        "ztime": ztime.toJson(),
        "zutime": zutime.toJson(),
        "zauserid": zauserid,
        "zuuserid": zuuserid,
        "zid": zid,
        "xdocnum": xdocnum,
        "xdate": xdate.toJson(),
        "xcus": xcus,
        "xstatusdoc": xstatusdoc,
        "xref": xref,
        "xdornum": xdornum,
        "xordernum": xordernum,
        "xwh": xwh,
        "xnote": xnote,
        "xtype": xtype,
        "xstype": xstype,
        "xstatusdor": xstatusdor,
        "xprime": xprime,
        "xterritory": xterritory,
        "xvatamt": xvatamt,
        "xdatecom": xdatecom.toJson(),
        "xtornum": xtornum,
        "xfwh": xfwh,
        "xtso": xtso,
        "xsp": xsp,
        "xsm": xsm,
        "xrsm": xrsm,
        "xareaop": xareaop,
        "xdivisionop": xdivisionop,
        "xthanaop": xthanaop,
        "xdistrictop": xdistrictop,
        "xsubcat": xsubcat,
        "xstatusar": xstatusar,
        "xstatusrec": xstatusrec,
        "xtruckno": xtruckno,
        "xstatus": xstatus,
        "xpreparer": xpreparer,
        "xsignatory1": xsignatory1,
        "xsigndate1": xsigndate1,
        "xsignatory2": xsignatory2,
        "xsigndate2": xsigndate2,
        "xsignatory3": xsignatory3,
        "xsigndate3": xsigndate3,
        "xsignatory4": xsignatory4,
        "xsigndate4": xsigndate4,
        "xsignatory5": xsignatory5,
        "xsigndate5": xsigndate5,
        "xsignatory6": xsignatory6,
        "xsigndate6": xsigndate6,
        "xsignatory7": xsignatory7,
        "xsigndate7": xsigndate7,
        "xidsup": xidsup,
        "xsuperior2": xsuperior2,
        "xsuperior3": xsuperior3,
        "xsignreject": xsignreject,
        "xdatereject": xdatereject,
        "xnote1": xnote1,
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
