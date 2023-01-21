// To parse this JSON data, do
//
//     final lfaApprovalNotiModel = lfaApprovalNotiModelFromJson(jsonString);

import 'dart:convert';

List<LfaApprovalNotiModel> lfaApprovalNotiModelFromJson(String str) => List<LfaApprovalNotiModel>.from(json.decode(str).map((x) => LfaApprovalNotiModel.fromJson(x)));

String lfaApprovalNotiModelToJson(List<LfaApprovalNotiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LfaApprovalNotiModel {
  LfaApprovalNotiModel({
    required this.adjustnum,
    required this.xdate,
    required this.xref,
    required this.xstatus,
    required this.xadvnum,
    required this.xdesc,
    required this.totalAdjust,
    required this.totalRequ,
    required this.xnote,
    required this.xdateret,
    required this.xdatereq,
    required this.xcompany,
    required this.name,
  });

  String adjustnum;
  Xdate xdate;
  String xref;
  String xstatus;
  String xadvnum;
  String xdesc;
  String totalAdjust;
  dynamic totalRequ;
  String xnote;
  Xdate xdateret;
  Xdate xdatereq;
  String xcompany;
  String name;

  factory LfaApprovalNotiModel.fromJson(Map<String, dynamic> json) => LfaApprovalNotiModel(
    adjustnum: json["adjustnum"],
    xdate: Xdate.fromJson(json["xdate"]),
    xref: json["xref"],
    xstatus: json["xstatus"],
    xadvnum: json["xadvnum"],
    xdesc: json["xdesc"],
    totalAdjust: json["total_adjust"],
    totalRequ: json["total_requ"],
    xnote: json["xnote"],
    xdateret: Xdate.fromJson(json["xdateret"]),
    xdatereq: Xdate.fromJson(json["xdatereq"]),
    xcompany: json["xcompany"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "adjustnum": adjustnum,
    "xdate": xdate.toJson(),
    "xref": xref,
    "xstatus": xstatus,
    "xadvnum": xadvnum,
    "xdesc": xdesc,
    "total_adjust": totalAdjust,
    "total_requ": totalRequ,
    "xnote": xnote,
    "xdateret": xdateret.toJson(),
    "xdatereq": xdatereq.toJson(),
    "xcompany": xcompany,
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
