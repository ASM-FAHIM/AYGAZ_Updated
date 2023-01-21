// To parse this JSON data, do
//
//     final bmModel = bmModelFromJson(jsonString);

import 'dart:convert';

List<BmModel> bmModelFromJson(String str) =>
    List<BmModel>.from(json.decode(str).map((x) => BmModel.fromJson(x)));

String bmModelToJson(List<BmModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BmModel {
  BmModel({
    required this.xunitpck,
    required this.xitem,
    required this.xdesc,
    required this.xpackweightnet,
    required this.xbombkey,
    required this.xdate,
    required this.prepbatch,
    required this.preparer,
    required this.designation,
    required this.deptname,
    required this.signname,
    required this.signdesignation,
    required this.signdeptname,
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xbomkey,
    required this.xtitem,
    required this.zactive,
    required this.xqtybase,
    required this.xbomtype,
    required this.xpreferbatchqty,
    required this.xdiv,
    required this.xunit,
    required this.xstatus,
    required this.xbomnum,
    required this.xlong,
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

  dynamic xunitpck;
  dynamic xitem;
  dynamic xdesc;
  dynamic xpackweightnet;
  dynamic xbombkey;
  Xdate xdate;
  dynamic prepbatch;
  dynamic preparer;
  dynamic designation;
  dynamic deptname;
  dynamic signname;
  dynamic signdesignation;
  dynamic signdeptname;
  Xdate ztime;
  dynamic zutime;
  dynamic zauserid;
  dynamic zuuserid;
  int zid;
  dynamic xbomkey;
  dynamic xtitem;
  dynamic zactive;
  dynamic xqtybase;
  dynamic xbomtype;
  dynamic xpreferbatchqty;
  dynamic xdiv;
  dynamic xunit;
  dynamic xstatus;
  dynamic xbomnum;
  dynamic xlong;
  dynamic xpreparer;
  dynamic xsignatory1;
  dynamic xsigndate1;
  dynamic xsignatory2;
  dynamic xsigndate2;
  dynamic xsignatory3;
  dynamic xsigndate3;
  dynamic xsignatory4;
  dynamic xsigndate4;
  dynamic xsignatory5;
  dynamic xsigndate5;
  dynamic xsignatory6;
  dynamic xsigndate6;
  dynamic xsignatory7;
  dynamic xsigndate7;
  dynamic xidsup;
  dynamic xsuperior2;
  dynamic xsuperior3;
  dynamic xsignreject;
  dynamic xdatereject;
  dynamic xnote1;

  factory BmModel.fromJson(Map<String, dynamic> json) => BmModel(
        xunitpck: json["xunitpck"],
        xitem: json["xitem"],
        xdesc: json["xdesc"],
        xpackweightnet: json["xpackweightnet"],
        xbombkey: json["xbombkey"],
        xdate: Xdate.fromJson(json["xdate"]),
        prepbatch: json["prepbatch"],
        preparer: json["preparer"],
        designation: json["designation"],
        deptname: json["deptname"],
        signname: json["signname"],
        signdesignation: json["signdesignation"],
        signdeptname: json["signdeptname"],
        ztime: Xdate.fromJson(json["ztime"]),
        zutime: json["zutime"],
        zauserid: json["zauserid"],
        zuuserid: json["zuuserid"] == null ? null : json["zuuserid"],
        zid: json["zid"],
        xbomkey: json["xbomkey"],
        xtitem: json["xtitem"],
        zactive: json["zactive"],
        xqtybase: json["xqtybase"],
        xbomtype: json["xbomtype"] == null ? null : json["xbomtype"],
        xpreferbatchqty: json["xpreferbatchqty"],
        xdiv: json["xdiv"],
        xunit: json["xunit"],
        xstatus: json["xstatus"],
        xbomnum: json["xbomnum"],
        xlong: json["xlong"],
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
        "xunitpck": xunitpck,
        "xitem": xitem,
        "xdesc": xdesc,
        "xpackweightnet": xpackweightnet,
        "xbombkey": xbombkey,
        "xdate": xdate.toJson(),
        "prepbatch": prepbatch,
        "preparer": preparer,
        "designation": designation,
        "deptname": deptname,
        "signname": signname,
        "signdesignation": signdesignation,
        "signdeptname": signdeptname,
        "ztime": ztime.toJson(),
        "zutime": zutime,
        "zauserid": zauserid,
        "zuuserid": zuuserid == null ? null : zuuserid,
        "zid": zid,
        "xbomkey": xbomkey,
        "xtitem": xtitem,
        "zactive": zactive,
        "xqtybase": xqtybase,
        "xbomtype": xbomtype == null ? null : xbomtype,
        "xpreferbatchqty": xpreferbatchqty,
        "xdiv": xdiv,
        "xunit": xunit,
        "xstatus": xstatus,
        "xbomnum": xbomnum,
        "xlong": xlong,
        "xpreparer": xpreparer,
        "xsignatory1": xsignatory1,
        "xsigndate1": xsigndate1.toJson(),
        "xsignatory2": xsignatory2,
        "xsigndate2": xsigndate2.toJson(),
        "xsignatory3": xsignatory3,
        "xsigndate3": xsigndate3.toJson(),
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
