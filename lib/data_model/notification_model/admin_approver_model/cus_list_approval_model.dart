// To parse this JSON data, do
//
//     final cusListApprovalModel = cusListApprovalModelFromJson(jsonString);

import 'dart:convert';

List<CusListApprovalModel> cusListApprovalModelFromJson(String str) =>
    List<CusListApprovalModel>.from(
        json.decode(str).map((x) => CusListApprovalModel.fromJson(x)));

String cusListApprovalModelToJson(List<CusListApprovalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CusListApprovalModel {
  CusListApprovalModel({
    required this.xcus,
    required this.xstatus,
    required this.xidsup,
    required this.xtype,
    required this.xtsoname,
    required this.ztime,
    required this.zutime,
    required this.zauserid,
    required this.zuuserid,
    required this.zid,
    required this.xorg,
    required this.xmadd,
    required this.xemail,
    required this.xphone,
    required this.xfax,
    required this.xurl,
    required this.xcrlimit,
    required this.xgcus,
    required this.xstatuscus,
    required this.xwh,
    required this.xmio,
    required this.xterritory,
    required this.xmarket,
    required this.xfm,
    required this.xdistrict,
    required this.xthana,
    required this.xfield,
    required this.xcrtermtype,
    required this.xcrterms,
    required this.xpaymentterm,
    required this.xproject,
    required this.xdateeff,
    required this.xdateexp,
    required this.xso,
    required this.xroute,
    required this.xlastcrdate,
    required this.xinvtoinvcr,
    required this.xallowcrinv,
    required this.xallbndisc,
    required this.xcode,
    required this.xref,
    required this.xdate,
    required this.xcontact,
    required this.xdisc,
    required this.xsp,
    required this.xoldcus,
    required this.xgsup,
    required this.xsupcat,
    required this.xmobile,
    required this.xcomm,
    required this.xcomm1,
    required this.xcomm2,
    required this.xcomm3,
    required this.xassessval1,
    required this.xassessval2,
    required this.xassessval3,
    required this.xsamtjar,
    required this.xsamtdispat,
    required this.xpaymenttype,
    required this.xcusold,
    required this.xvatregno,
    required this.xvatdef,
    required this.zactive,
    required this.xcity,
    required this.xcountry,
    required this.xtin,
    required this.xlicense,
    required this.xpostcode,
    required this.xcontactphn,
    required this.xpadd,
    required this.xname,
    required this.xoccupation,
    required this.xregion,
    required this.xdiscdet,
    required this.xdiscdetamt,
    required this.xdisctype,
    required this.xporamt,
    required this.xbonuspoints,
    required this.xreqbonuspoints,
    required this.xearnedbonusamt,
    required this.xexpday,
    required this.xblockday,
    required this.xprdcounter,
    required this.xdeliloc,
    required this.xdesignation,
    required this.xcustype,
    required this.xdelicontact,
    required this.xdelicontactphn,
    required this.xsalesperson,
    required this.xtransshipment,
    required this.xalias,
    required this.xnum,
    required this.xvatrate,
    required this.xunderateinv,
    required this.xnid,
    required this.xcuscomptype,
    required this.xattn,
    required this.xdateinactive,
    required this.xlocation,
    required this.xowner,
    required this.xownerph,
    required this.xgagnt,
    required this.xbin,
    required this.xircno,
    required this.xerc,
    required this.xownership,
    required this.xecoact,
    required this.xsuperior2,
    required this.xsuperior3,
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
    required this.xsuperiorsp,
    required this.xsigndate7,
    required this.xbinadd,
    required this.xsubcat,
    required this.xdivisionop,
    required this.xareaop,
    required this.xnote1,
    required this.xsignreject,
    required this.xdatereject,
    required this.xbank,
    required this.xbranch,
    required this.xrouting,
    required this.xacc,
    required this.xacctype,
  });

  dynamic xcus;
  dynamic xstatus;
  dynamic xidsup;
  dynamic xtype;
  dynamic xtsoname;
  dynamic ztime;
  dynamic zutime;
  dynamic zauserid;
  dynamic zuuserid;
  int zid;
  dynamic xorg;
  dynamic xmadd;
  dynamic xemail;
  dynamic xphone;
  dynamic xfax;
  dynamic xurl;
  dynamic xcrlimit;
  dynamic xgcus;
  dynamic xstatuscus;
  dynamic xwh;
  dynamic xmio;
  dynamic xterritory;
  dynamic xmarket;
  dynamic xfm;
  dynamic xdistrict;
  dynamic xthana;
  dynamic xfield;
  dynamic xcrtermtype;
  int xcrterms;
  dynamic xpaymentterm;
  dynamic xproject;
  dynamic xdateeff;
  dynamic xdateexp;
  dynamic xso;
  dynamic xroute;
  dynamic xlastcrdate;
  dynamic xinvtoinvcr;
  dynamic xallowcrinv;
  dynamic xallbndisc;
  dynamic xcode;
  dynamic xref;
  dynamic xdate;
  dynamic xcontact;
  dynamic xdisc;
  dynamic xsp;
  dynamic xoldcus;
  dynamic xgsup;
  dynamic xsupcat;
  dynamic xmobile;
  dynamic xcomm;
  dynamic xcomm1;
  dynamic xcomm2;
  dynamic xcomm3;
  dynamic xassessval1;
  dynamic xassessval2;
  dynamic xassessval3;
  dynamic xsamtjar;
  dynamic xsamtdispat;
  dynamic xpaymenttype;
  dynamic xcusold;
  dynamic xvatregno;
  dynamic xvatdef;
  dynamic zactive;
  dynamic xcity;
  dynamic xcountry;
  dynamic xtin;
  dynamic xlicense;
  dynamic xpostcode;
  dynamic xcontactphn;
  dynamic xpadd;
  dynamic xname;
  dynamic xoccupation;
  dynamic xregion;
  dynamic xdiscdet;
  dynamic xdiscdetamt;
  dynamic xdisctype;
  dynamic xporamt;
  dynamic xbonuspoints;
  dynamic xreqbonuspoints;
  dynamic xearnedbonusamt;
  dynamic xexpday;
  dynamic xblockday;
  dynamic xprdcounter;
  dynamic xdeliloc;
  dynamic xdesignation;
  dynamic xcustype;
  dynamic xdelicontact;
  dynamic xdelicontactphn;
  dynamic xsalesperson;
  dynamic xtransshipment;
  dynamic xalias;
  dynamic xnum;
  dynamic xvatrate;
  dynamic xunderateinv;
  dynamic xnid;
  dynamic xcuscomptype;
  dynamic xattn;
  dynamic xdateinactive;
  dynamic xlocation;
  dynamic xowner;
  dynamic xownerph;
  dynamic xgagnt;
  dynamic xbin;
  dynamic xircno;
  dynamic xerc;
  dynamic xownership;
  dynamic xecoact;
  dynamic xsuperior2;
  dynamic xsuperior3;
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
  dynamic xsuperiorsp;
  dynamic xsigndate7;
  dynamic xbinadd;
  dynamic xsubcat;
  dynamic xdivisionop;
  dynamic xareaop;
  dynamic xnote1;
  dynamic xsignreject;
  dynamic xdatereject;
  dynamic xbank;
  dynamic xbranch;
  dynamic xrouting;
  dynamic xacc;
  dynamic xacctype;

  factory CusListApprovalModel.fromJson(Map<String, dynamic> json) =>
      CusListApprovalModel(
        xcus: json["xcus"] == null ? null : json["xcus"],
        xstatus: json["xstatus"] == null ? null : json["xstatus"],
        xidsup: json["xidsup"] == null ? null : json["xidsup"],
        xtype: json["xtype"] == null ? null : json["xtype"],
        xtsoname: json["xtsoname"] == null ? null : json["xtsoname"],
        ztime: json["ztime"],
        zutime: json["zutime"],
        zauserid: json["zauserid"] == null ? null : json["zauserid"],
        zuuserid: json["zuuserid"] == null ? null : json["zuuserid"],
        zid: json["zid"] == null ? null : json["zid"],
        xorg: json["xorg"] == null ? null : json["xorg"],
        xmadd: json["xmadd"] == null ? null : json["xmadd"],
        xemail: json["xemail"] == null ? null : json["xemail"],
        xphone: json["xphone"] == null ? null : json["xphone"],
        xfax: json["xfax"] == null ? null : json["xfax"],
        xurl: json["xurl"],
        xcrlimit: json["xcrlimit"] == null ? null : json["xcrlimit"],
        xgcus: json["xgcus"] == null ? null : json["xgcus"],
        xstatuscus: json["xstatuscus"] == null ? null : json["xstatuscus"],
        xwh: json["xwh"] == null ? null : json["xwh"],
        xmio: json["xmio"],
        xterritory: json["xterritory"] == null ? null : json["xterritory"],
        xmarket: json["xmarket"] == null ? null : json["xmarket"],
        xfm: json["xfm"],
        xdistrict: json["xdistrict"] == null ? null : json["xdistrict"],
        xthana: json["xthana"] == null ? null : json["xthana"],
        xfield: json["xfield"] == null ? null : json["xfield"],
        xcrtermtype: json["xcrtermtype"],
        xcrterms: json["xcrterms"] == null ? null : json["xcrterms"],
        xpaymentterm:
            json["xpaymentterm"] == null ? null : json["xpaymentterm"],
        xproject: json["xproject"],
        xdateeff: json["xdateeff"],
        xdateexp: json["xdateexp"],
        xso: json["xso"] == null ? null : json["xso"],
        xroute: json["xroute"] == null ? null : json["xroute"],
        xlastcrdate: json["xlastcrdate"],
        xinvtoinvcr: json["xinvtoinvcr"] == null ? null : json["xinvtoinvcr"],
        xallowcrinv: json["xallowcrinv"] == null ? null : json["xallowcrinv"],
        xallbndisc: json["xallbndisc"] == null ? null : json["xallbndisc"],
        xcode: json["xcode"],
        xref: json["xref"] == null ? null : json["xref"],
        xdate: json["xdate"],
        xcontact: json["xcontact"] == null ? null : json["xcontact"],
        xdisc: json["xdisc"] == null ? null : json["xdisc"],
        xsp: json["xsp"] == null ? null : json["xsp"],
        xoldcus: json["xoldcus"],
        xgsup: json["xgsup"],
        xsupcat: json["xsupcat"] == null ? null : json["xsupcat"],
        xmobile: json["xmobile"],
        xcomm: json["xcomm"],
        xcomm1: json["xcomm1"],
        xcomm2: json["xcomm2"],
        xcomm3: json["xcomm3"],
        xassessval1: json["xassessval1"],
        xassessval2: json["xassessval2"],
        xassessval3: json["xassessval3"],
        xsamtjar: json["xsamtjar"],
        xsamtdispat: json["xsamtdispat"],
        xpaymenttype: json["xpaymenttype"],
        xcusold: json["xcusold"],
        xvatregno: json["xvatregno"] == null ? null : json["xvatregno"],
        xvatdef: json["xvatdef"],
        zactive: json["zactive"] == null ? null : json["zactive"],
        xcity: json["xcity"],
        xcountry: json["xcountry"],
        xtin: json["xtin"],
        xlicense: json["xlicense"],
        xpostcode: json["xpostcode"],
        xcontactphn: json["xcontactphn"],
        xpadd: json["xpadd"],
        xname: json["xname"],
        xoccupation: json["xoccupation"],
        xregion: json["xregion"],
        xdiscdet: json["xdiscdet"],
        xdiscdetamt: json["xdiscdetamt"] == null ? null : json["xdiscdetamt"],
        xdisctype: json["xdisctype"],
        xporamt: json["xporamt"],
        xbonuspoints: json["xbonuspoints"],
        xreqbonuspoints: json["xreqbonuspoints"],
        xearnedbonusamt: json["xearnedbonusamt"],
        xexpday: json["xexpday"],
        xblockday: json["xblockday"],
        xprdcounter: json["xprdcounter"],
        xdeliloc: json["xdeliloc"] == null ? null : json["xdeliloc"],
        xdesignation:
            json["xdesignation"] == null ? null : json["xdesignation"],
        xcustype: json["xcustype"] == null ? null : json["xcustype"],
        xdelicontact:
            json["xdelicontact"] == null ? null : json["xdelicontact"],
        xdelicontactphn:
            json["xdelicontactphn"] == null ? null : json["xdelicontactphn"],
        xsalesperson: json["xsalesperson"],
        xtransshipment:
            json["xtransshipment"] == null ? null : json["xtransshipment"],
        xalias: json["xalias"],
        xnum: json["xnum"],
        xvatrate: json["xvatrate"],
        xunderateinv: json["xunderateinv"],
        xnid: json["xnid"] == null ? null : json["xnid"],
        xcuscomptype:
            json["xcuscomptype"] == null ? null : json["xcuscomptype"],
        xattn: json["xattn"],
        xdateinactive: json["xdateinactive"],
        xlocation: json["xlocation"],
        xowner: json["xowner"],
        xownerph: json["xownerph"],
        xgagnt: json["xgagnt"],
        xbin: json["xbin"],
        xircno: json["xircno"],
        xerc: json["xerc"],
        xownership: json["xownership"],
        xecoact: json["xecoact"],
        xsuperior2: json["xsuperior2"],
        xsuperior3: json["xsuperior3"],
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
        xsuperiorsp: json["xsuperiorsp"],
        xsigndate7: json["xsigndate7"],
        xbinadd: json["xbinadd"],
        xsubcat: json["xsubcat"] == null ? null : json["xsubcat"],
        xdivisionop: json["xdivisionop"] == null ? null : json["xdivisionop"],
        xareaop: json["xareaop"] == null ? null : json["xareaop"],
        xnote1: json["xnote1"] == null ? null : json["xnote1"],
        xsignreject: json["xsignreject"],
        xdatereject: json["xdatereject"],
        xbank: json["xbank"],
        xbranch: json["xbranch"],
        xrouting: json["xrouting"],
        xacc: json["xacc"],
        xacctype: json["xacctype"],
      );

  Map<String, dynamic> toJson() => {
        "xcus": xcus == null ? null : xcus,
        "xstatus": xstatus == null ? null : xstatus,
        "xidsup": xidsup == null ? null : xidsup,
        "xtype": xtype == null ? null : xtype,
        "xtsoname": xtsoname == null ? null : xtsoname,
        "ztime": ztime == null ? null : ztime.toJson(),
        "zutime": zutime == null ? null : zutime.toJson(),
        "zauserid": zauserid == null ? null : zauserid,
        "zuuserid": zuuserid == null ? null : zuuserid,
        "zid": zid == null ? null : zid,
        "xorg": xorg == null ? null : xorg,
        "xmadd": xmadd == null ? null : xmadd,
        "xemail": xemail == null ? null : xemail,
        "xphone": xphone == null ? null : xphone,
        "xfax": xfax == null ? null : xfax,
        "xurl": xurl,
        "xcrlimit": xcrlimit == null ? null : xcrlimit,
        "xgcus": xgcus == null ? null : xgcus,
        "xstatuscus": xstatuscus == null ? null : xstatuscus,
        "xwh": xwh == null ? null : xwh,
        "xmio": xmio,
        "xterritory": xterritory == null ? null : xterritory,
        "xmarket": xmarket == null ? null : xmarket,
        "xfm": xfm,
        "xdistrict": xdistrict == null ? null : xdistrict,
        "xthana": xthana == null ? null : xthana,
        "xfield": xfield == null ? null : xfield,
        "xcrtermtype": xcrtermtype,
        "xcrterms": xcrterms == null ? null : xcrterms,
        "xpaymentterm": xpaymentterm == null ? null : xpaymentterm,
        "xproject": xproject,
        "xdateeff": xdateeff == null ? null : xdateeff.toJson(),
        "xdateexp": xdateexp == null ? null : xdateexp.toJson(),
        "xso": xso == null ? null : xso,
        "xroute": xroute == null ? null : xroute,
        "xlastcrdate": xlastcrdate,
        "xinvtoinvcr": xinvtoinvcr == null ? null : xinvtoinvcr,
        "xallowcrinv": xallowcrinv == null ? null : xallowcrinv,
        "xallbndisc": xallbndisc == null ? null : xallbndisc,
        "xcode": xcode,
        "xref": xref == null ? null : xref,
        "xdate": xdate,
        "xcontact": xcontact == null ? null : xcontact,
        "xdisc": xdisc == null ? null : xdisc,
        "xsp": xsp == null ? null : xsp,
        "xoldcus": xoldcus,
        "xgsup": xgsup,
        "xsupcat": xsupcat == null ? null : xsupcat,
        "xmobile": xmobile,
        "xcomm": xcomm,
        "xcomm1": xcomm1,
        "xcomm2": xcomm2,
        "xcomm3": xcomm3,
        "xassessval1": xassessval1,
        "xassessval2": xassessval2,
        "xassessval3": xassessval3,
        "xsamtjar": xsamtjar,
        "xsamtdispat": xsamtdispat,
        "xpaymenttype": xpaymenttype,
        "xcusold": xcusold,
        "xvatregno": xvatregno == null ? null : xvatregno,
        "xvatdef": xvatdef,
        "zactive": zactive == null ? null : zactive,
        "xcity": xcity,
        "xcountry": xcountry,
        "xtin": xtin,
        "xlicense": xlicense,
        "xpostcode": xpostcode,
        "xcontactphn": xcontactphn,
        "xpadd": xpadd,
        "xname": xname,
        "xoccupation": xoccupation,
        "xregion": xregion,
        "xdiscdet": xdiscdet,
        "xdiscdetamt": xdiscdetamt == null ? null : xdiscdetamt,
        "xdisctype": xdisctype,
        "xporamt": xporamt,
        "xbonuspoints": xbonuspoints,
        "xreqbonuspoints": xreqbonuspoints,
        "xearnedbonusamt": xearnedbonusamt,
        "xexpday": xexpday,
        "xblockday": xblockday,
        "xprdcounter": xprdcounter,
        "xdeliloc": xdeliloc == null ? null : xdeliloc,
        "xdesignation": xdesignation == null ? null : xdesignation,
        "xcustype": xcustype == null ? null : xcustype,
        "xdelicontact": xdelicontact == null ? null : xdelicontact,
        "xdelicontactphn": xdelicontactphn == null ? null : xdelicontactphn,
        "xsalesperson": xsalesperson,
        "xtransshipment": xtransshipment == null ? null : xtransshipment,
        "xalias": xalias,
        "xnum": xnum,
        "xvatrate": xvatrate,
        "xunderateinv": xunderateinv,
        "xnid": xnid == null ? null : xnid,
        "xcuscomptype": xcuscomptype == null ? null : xcuscomptype,
        "xattn": xattn,
        "xdateinactive": xdateinactive,
        "xlocation": xlocation,
        "xowner": xowner,
        "xownerph": xownerph,
        "xgagnt": xgagnt,
        "xbin": xbin,
        "xircno": xircno,
        "xerc": xerc,
        "xownership": xownership,
        "xecoact": xecoact,
        "xsuperior2": xsuperior2,
        "xsuperior3": xsuperior3,
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
        "xsuperiorsp": xsuperiorsp,
        "xsigndate7": xsigndate7,
        "xbinadd": xbinadd,
        "xsubcat": xsubcat == null ? null : xsubcat,
        "xdivisionop": xdivisionop == null ? null : xdivisionop,
        "xareaop": xareaop == null ? null : xareaop,
        "xnote1": xnote1 == null ? null : xnote1,
        "xsignreject": xsignreject,
        "xdatereject": xdatereject,
        "xbank": xbank,
        "xbranch": xbranch,
        "xrouting": xrouting,
        "xacc": xacc,
        "xacctype": xacctype,
      };
}

class Xdateeff {
  Xdateeff({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory Xdateeff.fromJson(Map<String, dynamic> json) => Xdateeff(
        date: json["date"],
        timezoneType:
            json["timezone_type"] == null ? null : json["timezone_type"],
        timezone: json["timezone"] == null ? null : json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date.toIso8601String(),
        "timezone_type": timezoneType == null ? null : timezoneType,
        "timezone": timezone == null ? null : timezone,
      };
}
