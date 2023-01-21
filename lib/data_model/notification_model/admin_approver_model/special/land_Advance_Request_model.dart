// To parse this JSON data, do
//
//     final landAdvanceNotiModel = landAdvanceNotiModelFromJson(jsonString);

import 'dart:convert';

List<LandAdvanceNotiModel> landAdvanceNotiModelFromJson(String str) => List<LandAdvanceNotiModel>.from(json.decode(str).map((x) => LandAdvanceNotiModel.fromJson(x)));

String landAdvanceNotiModelToJson(List<LandAdvanceNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LandAdvanceNotiModel {
  LandAdvanceNotiModel({
    required this.acreqnum,
    required this.xdate,
    required this.xstatusreq,
    required this.xpornum,
    required this.xempunit,
    required this.xprime,
    required this.xprojectdesc,
    required this.xstatus,
    required this.xnote,
    required this.projectname,
    required this.sellername
  });

  dynamic acreqnum;
  Xdate xdate;
  dynamic xstatusreq;
  dynamic xpornum;
  dynamic xempunit;
  dynamic xprime;
  dynamic xprojectdesc;
  dynamic xstatus;
  dynamic xnote;
  dynamic sellername;
  dynamic projectname;

  factory LandAdvanceNotiModel.fromJson(Map<String, dynamic> json) => LandAdvanceNotiModel(
    acreqnum: json["acreqnum"],
    xdate: Xdate.fromJson(json["xdate"]),
    xstatusreq: json["xstatusreq"],
    xpornum: json["xpornum"],
    xempunit: json["xempunit"],
    xprime: json["xprime"],
    xprojectdesc: json["xprojectdesc"],
    xstatus: json["xstatus"],
    xnote: json["xnote"],
    sellername: json["sellername"],
    projectname: json["projectname"]
  );

  Map<String, dynamic> toJson() => {
    "acreqnum": acreqnum,
    "xdate": xdate.toJson(),
    "xstatusreq": xstatusreq,
    "xpornum": xpornum,
    "xempunit": xempunit,
    "xprime": xprime,
    "xprojectdesc": xprojectdesc,
    "xstatus": xstatus,
    "xnote": xnote,
    "sellername": sellername,
    "projectname": projectname,

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
