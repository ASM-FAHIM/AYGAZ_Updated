//
// import 'dart:convert';
//
// LoginModel loginModelFromJson(dynamic str) => LoginModel.fromJson(json.decode(str));
//
// dynamic loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
//
//
// class LoginModel {
//   LoginModel({
//     required this.ztime,
//     required this.zutime,
//     required this.zid,
//     required this.zemail,
//     required this.xpassword,
//     required this.xaccess,
//     required this.xdformat,
//     required this.xdsep,
//     required this.zactive,
//     required this.zauserid,
//     required this.zuuserid,
//     required this.xlastlogdate,
//     required this.xname,
//     required this.zaip,
//     required this.zuip,
//     required this.xwh,
//     required this.xsp,
//     required this.xrole,
//     required this.xoldpass,
//     required this.xposition,
//     required this.zscreen,
//   });
//
//   Xlastlogdate ztime;
//   Xlastlogdate zutime;
//   int zid;
//   dynamic zemail;
//   dynamic xpassword;
//   dynamic xaccess;
//   dynamic xdformat;
//   dynamic xdsep;
//   dynamic zactive;
//   dynamic zauserid;
//   dynamic zuuserid;
//   Xlastlogdate xlastlogdate;
//   dynamic xname;
//   dynamic zaip;
//   dynamic zuip;
//   dynamic xwh;
//   dynamic xsp;
//   dynamic xrole;
//   dynamic xoldpass;
//   dynamic xposition;
//   dynamic zscreen;
//
//   factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
//     ztime: Xlastlogdate.fromJson(json["ztime"]),
//     zutime: Xlastlogdate.fromJson(json["zutime"]),
//     zid: json["zid"],
//     zemail: json["zemail"],
//     xpassword: json["xpassword"],
//     xaccess: json["xaccess"],
//     xdformat: json["xdformat"],
//     xdsep: json["xdsep"],
//     zactive: json["zactive"],
//     zauserid: json["zauserid"],
//     zuuserid: json["zuuserid"],
//     xlastlogdate: Xlastlogdate.fromJson(json["xlastlogdate"]),
//     xname: json["xname"],
//     zaip: json["zaip"],
//     zuip: json["zuip"],
//     xwh: json["xwh"],
//     xsp: json["xsp"],
//     xrole: json["xrole"],
//     xoldpass: json["xoldpass"],
//     xposition: json["xposition"],
//     zscreen: json["zscreen"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "ztime": ztime.toJson(),
//     "zutime": zutime.toJson(),
//     "zid": zid,
//     "zemail": zemail,
//     "xpassword": xpassword,
//     "xaccess": xaccess,
//     "xdformat": xdformat,
//     "xdsep": xdsep,
//     "zactive": zactive,
//     "zauserid": zauserid,
//     "zuuserid": zuuserid,
//     "xlastlogdate": xlastlogdate.toJson(),
//     "xname": xname,
//     "zaip": zaip,
//     "zuip": zuip,
//     "xwh": xwh,
//     "xsp": xsp,
//     "xrole": xrole,
//     "xoldpass": xoldpass,
//     "xposition": xposition,
//     "zscreen": zscreen,
//   };
// }
//
// class Xlastlogdate {
//   Xlastlogdate({
//     required this.date,
//     required this.timezoneType,
//     required this.timezone,
//   });
//
//   DateTime date;
//   int timezoneType;
//   dynamic timezone;
//
//   factory Xlastlogdate.fromJson(Map<dynamic, dynamic> json) => Xlastlogdate(
//     date: DateTime.parse(json["date"]),
//     timezoneType: json["timezone_type"],
//     timezone: json["timezone"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "date": date.toIso8601dynamic(),
//     "timezone_type": timezoneType,
//     "timezone": timezone,
//   };
// }

//
// import 'dart:convert';
//
// LoginModel loginModelFromJson(dynamic str) => LoginModel.fromJson(json.decode(str));
//
// dynamic loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
//
//
// class LoginModel {
//   LoginModel({
//     required this.ztime,
//     required this.zutime,
//     required this.zid,
//     required this.zemail,
//     required this.xpassword,
//     required this.xaccess,
//     required this.xdformat,
//     required this.xdsep,
//     required this.zactive,
//     required this.zauserid,
//     required this.zuuserid,
//     required this.xlastlogdate,
//     required this.xname,
//     required this.zaip,
//     required this.zuip,
//     required this.xwh,
//     required this.xsp,
//     required this.xrole,
//     required this.xoldpass,
//     required this.xposition,
//     required this.zscreen,
//     required this.xstaff,
//     required this.xfname,
//     required this.xmname,
//     required this.xmadd,
//     required this.xpadd,
//     required this.xbirthdate,
//     required this.xsex,
//     required this.xmstat,
//     required this.xgroup,
//     required this.xdeptname,
//     required this.xsec,
//     required this.xdesignation,
//     required this.xdatejoin,
//     required this.xgrade,
//     required this.xbasic,
//     required this.xhrent,
//     required this.xmedical,
//     required this.xconveyance,
//     required this.xemail,
//     required this.xenddate,
//     required this.xretdate,
//     required this.xempstatus,
//     required this.xlocation,
//     required this.xtaxamt,
//     required this.xpfamount,
//     required this.xdistrict,
//     required this.xdatecom,
//     required this.xinvamt,
//     required this.xamount,
//     required this.xdeduction,
//     required this.xinclude,
//     required this.xnightallowance,
//     required this.xshoeallowance,
//     required this.xbank,
//     required this.xdesc,
//     required this.xacc,
//     required this.xhaccomodation,
//     required this.xtin,
//     required this.xempcategory,
//     required this.xstatus,
//     required this.xbatch,
//     required this.xsid,
//     required this.ximage,
//     required this.xbloodgroup,
//     required this.xphone,
//     required this.xhrc1,
//     required this.xhrc2,
//     required this.xhrc3,
//     required this.xhrc4,
//     required this.xplan,
//     required this.xcar,
//     required this.xlyearti,
//     required this.xgross,
//     required this.xhour,
//     required this.xrate,
//     required this.xsplan,
//     required this.xemname,
//     required this.xrelation,
//     required this.xemcmobile,
//     required this.xmobile,
//     required this.xdeptdesc,
//     required this.xcatdesc,
//     required this.xnimage,
//     required this.xreligion,
//     required this.xemptype,
//     required this.xsignature,
//     required this.xfile,
//     required this.xidsup,
//     required this.xsuperiorsp,
//     required this.xsuperiorpo,
//     required this.xsuperiorgl,
//     required this.xsuperiorcs,
//     required this.xsuperiorcnf,
//     required this.xsuperioradj,
//     required this.xsuperiorapn,
//     required this.xempposition,
//     required this.xsuperiorcnfbl,
//     required this.xgrossold,
//     required this.xsignatory,
//     required this.xrouting,
//     required this.xacctype,
//     required this.xempbank,
//     required this.xsuperioradv,
//     required this.xsuperiorpaf,
//     required this.xsuperioreadj,
//     required this.xsuperiorerq,
//     required this.xsuperiorcash,
//     required this.xemailc,
//     required this.xfstname,
//     required this.xlstname,
//     required this.xbankamt,
//     required this.xcashamt,
//     required this.xempgrade,
//     required this.xsection,
//     required this.xshift,
//     required this.xemptimein,
//     required this.xemptimeout,
//     required this.xpfconrate,
//     required this.xpfdef,
//     required this.xitdef,
//     required this.xroster,
//     required this.xadminid,
//     required this.xweekday,
//     required this.xhdayapp,
//     required this.xtaxzone,
//     required this.xenddtcontract,
//     required this.xsuperior2,
//     required this.xsuperior3,
//     required this.xsuperior4,
//     required this.xsuperior5,
//     required this.xsuperior6,
//     required this.xstatus1,
//     required this.xstatus2,
//     required this.xstatus3,
//     required this.xwkndnotapp,
//     required this.xfdesignation,
//     required this.xnote1,
//     required this.xnote2,
//     required this.xbonusnotapp,
//   });
//
//   Xlastlogdate ztime;
//   Xlastlogdate zutime;
//   int zid;
//   dynamic zemail;
//   dynamic xpassword;
//   dynamic xaccess;
//   dynamic xdformat;
//   dynamic xdsep;
//   dynamic zactive;
//   dynamic zauserid;
//   dynamic zuuserid;
//   Xlastlogdate xlastlogdate;
//   dynamic xname;
//   dynamic zaip;
//   dynamic zuip;
//   dynamic xwh;
//   dynamic xsp;
//   dynamic xrole;
//   dynamic xoldpass;
//   dynamic xposition;
//   dynamic zscreen;
//   dynamic xstaff;
//   dynamic xfname;
//   dynamic xmname;
//   dynamic xmadd;
//   dynamic xpadd;
//   Xbirthdate xbirthdate;
//   dynamic xsex;
//   dynamic xmstat;
//   dynamic xgroup;
//   dynamic xdeptname;
//   dynamic xsec;
//   dynamic xdesignation;
//   Xbirthdate xdatejoin;
//   dynamic xgrade;
//   dynamic xbasic;
//   dynamic xhrent;
//   dynamic xmedical;
//   dynamic xconveyance;
//   dynamic xemail;
//   dynamic xenddate;
//   Xbirthdate xretdate;
//   dynamic xempstatus;
//   dynamic xlocation;
//   dynamic xtaxamt;
//   dynamic xpfamount;
//   dynamic xdistrict;
//   Xbirthdate xdatecom;
//   dynamic xinvamt;
//   dynamic xamount;
//   dynamic xdeduction;
//   dynamic xinclude;
//   dynamic xnightallowance;
//   dynamic xshoeallowance;
//   dynamic xbank;
//   dynamic xdesc;
//   dynamic xacc;
//   dynamic xhaccomodation;
//   dynamic xtin;
//   dynamic xempcategory;
//   dynamic xstatus;
//   dynamic xbatch;
//   dynamic xsid;
//   dynamic ximage;
//   dynamic xbloodgroup;
//   dynamic xphone;
//   dynamic xhrc1;
//   dynamic xhrc2;
//   dynamic xhrc3;
//   dynamic xhrc4;
//   dynamic xplan;
//   dynamic xcar;
//   dynamic xlyearti;
//   dynamic xgross;
//   dynamic xhour;
//   dynamic xrate;
//   dynamic xsplan;
//   dynamic xemname;
//   dynamic xrelation;
//   dynamic xemcmobile;
//   dynamic xmobile;
//   dynamic xdeptdesc;
//   dynamic xcatdesc;
//   dynamic xnimage;
//   dynamic xreligion;
//   dynamic xemptype;
//   dynamic xsignature;
//   dynamic xfile;
//   dynamic xidsup;
//   dynamic xsuperiorsp;
//   dynamic xsuperiorpo;
//   dynamic xsuperiorgl;
//   dynamic xsuperiorcs;
//   dynamic xsuperiorcnf;
//   dynamic xsuperioradj;
//   dynamic xsuperiorapn;
//   dynamic xempposition;
//   dynamic xsuperiorcnfbl;
//   dynamic xgrossold;
//   dynamic xsignatory;
//   dynamic xrouting;
//   dynamic xacctype;
//   dynamic xempbank;
//   dynamic xsuperioradv;
//   dynamic xsuperiorpaf;
//   dynamic xsuperioreadj;
//   dynamic xsuperiorerq;
//   dynamic xsuperiorcash;
//   dynamic xemailc;
//   dynamic xfstname;
//   dynamic xlstname;
//   dynamic xbankamt;
//   dynamic xcashamt;
//   dynamic xempgrade;
//   dynamic xsection;
//   dynamic xshift;
//   dynamic xemptimein;
//   dynamic xemptimeout;
//   dynamic xpfconrate;
//   dynamic xpfdef;
//   dynamic xitdef;
//   dynamic xroster;
//   dynamic xadminid;
//   dynamic xweekday;
//   dynamic xhdayapp;
//   dynamic xtaxzone;
//   dynamic xenddtcontract;
//   dynamic xsuperior2;
//   dynamic xsuperior3;
//   dynamic xsuperior4;
//   dynamic xsuperior5;
//   dynamic xsuperior6;
//   dynamic xstatus1;
//   dynamic xstatus2;
//   dynamic xstatus3;
//   dynamic xwkndnotapp;
//   dynamic xfdesignation;
//   dynamic xnote1;
//   dynamic xnote2;
//   dynamic xbonusnotapp;
//
//
//   factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
//     ztime: Xlastlogdate.fromJson(json["ztime"]),
//     zutime: Xlastlogdate.fromJson(json["zutime"]),
//     zid: json["zid"],
//     zemail: json["zemail"],
//     xpassword: json["xpassword"],
//     xaccess: json["xaccess"],
//     xdformat: json["xdformat"],
//     xdsep: json["xdsep"],
//     zactive: json["zactive"],
//     zauserid: json["zauserid"],
//     zuuserid: json["zuuserid"],
//     xlastlogdate: Xlastlogdate.fromJson(json["xlastlogdate"]),
//     xname: json["xname"],
//     zaip: json["zaip"],
//     zuip: json["zuip"],
//     xwh: json["xwh"],
//     xsp: json["xsp"],
//     xrole: json["xrole"],
//     xoldpass: json["xoldpass"],
//     xposition: json["xposition"],
//     zscreen: json["zscreen"],
//     xstaff: json["xstaff"],
//     xfname: json["xfname"],
//     xmname: json["xmname"],
//     xmadd: json["xmadd"],
//     xpadd: json["xpadd"],
//     xbirthdate: Xbirthdate.fromJson(json["xbirthdate"]),
//     xsex: json["xsex"],
//     xmstat: json["xmstat"],
//     xgroup: json["xgroup"],
//     xdeptname: json["xdeptname"],
//     xsec: json["xsec"],
//     xdesignation: json["xdesignation"],
//     xdatejoin: Xbirthdate.fromJson(json["xdatejoin"]),
//     xgrade: json["xgrade"],
//     xbasic: json["xbasic"],
//     xhrent: json["xhrent"],
//     xmedical: json["xmedical"],
//     xconveyance: json["xconveyance"],
//     xemail: json["xemail"],
//     xenddate: json["xenddate"],
//     xretdate: Xbirthdate.fromJson(json["xretdate"]),
//     xempstatus: json["xempstatus"],
//     xlocation: json["xlocation"],
//     xtaxamt: json["xtaxamt"],
//     xpfamount: json["xpfamount"],
//     xdistrict: json["xdistrict"],
//     xdatecom: Xbirthdate.fromJson(json["xdatecom"]),
//     xinvamt: json["xinvamt"],
//     xamount: json["xamount"],
//     xdeduction: json["xdeduction"],
//     xinclude: json["xinclude"],
//     xnightallowance: json["xnightallowance"],
//     xshoeallowance: json["xshoeallowance"],
//     xbank: json["xbank"],
//     xdesc: json["xdesc"],
//     xacc: json["xacc"],
//     xhaccomodation: json["xhaccomodation"],
//     xtin: json["xtin"],
//     xempcategory: json["xempcategory"],
//     xstatus: json["xstatus"],
//     xbatch: json["xbatch"],
//     xsid: json["xsid"],
//     ximage: json["ximage"],
//     xbloodgroup: json["xbloodgroup"],
//     xphone: json["xphone"],
//     xhrc1: json["xhrc1"],
//     xhrc2: json["xhrc2"],
//     xhrc3: json["xhrc3"],
//     xhrc4: json["xhrc4"],
//     xplan: json["xplan"],
//     xcar: json["xcar"],
//     xlyearti: json["xlyearti"],
//     xgross: json["xgross"],
//     xhour: json["xhour"],
//     xrate: json["xrate"],
//     xsplan: json["xsplan"],
//     xemname: json["xemname"],
//     xrelation: json["xrelation"],
//     xemcmobile: json["xemcmobile"],
//     xmobile: json["xmobile"],
//     xdeptdesc: json["xdeptdesc"],
//     xcatdesc: json["xcatdesc"],
//     xnimage: json["xnimage"],
//     xreligion: json["xreligion"],
//     xemptype: json["xemptype"],
//     xsignature: json["xsignature"],
//     xfile: json["xfile"],
//     xidsup: json["xidsup"],
//     xsuperiorsp: json["xsuperiorsp"],
//     xsuperiorpo: json["xsuperiorpo"],
//     xsuperiorgl: json["xsuperiorgl"],
//     xsuperiorcs: json["xsuperiorcs"],
//     xsuperiorcnf: json["xsuperiorcnf"],
//     xsuperioradj: json["xsuperioradj"],
//     xsuperiorapn: json["xsuperiorapn"],
//     xempposition: json["xempposition"],
//     xsuperiorcnfbl: json["xsuperiorcnfbl"],
//     xgrossold: json["xgrossold"],
//     xsignatory: json["xsignatory"],
//     xrouting: json["xrouting"],
//     xacctype: json["xacctype"],
//     xempbank: json["xempbank"],
//     xsuperioradv: json["xsuperioradv"],
//     xsuperiorpaf: json["xsuperiorpaf"],
//     xsuperioreadj: json["xsuperioreadj"],
//     xsuperiorerq: json["xsuperiorerq"],
//     xsuperiorcash: json["xsuperiorcash"],
//     xemailc: json["xemailc"],
//     xfstname: json["xfstname"],
//     xlstname: json["xlstname"],
//     xbankamt: json["xbankamt"],
//     xcashamt: json["xcashamt"],
//     xempgrade: json["xempgrade"],
//     xsection: json["xsection"],
//     xshift: json["xshift"],
//     xemptimein: json["xemptimein"],
//     xemptimeout: json["xemptimeout"],
//     xpfconrate: json["xpfconrate"],
//     xpfdef: json["xpfdef"],
//     xitdef: json["xitdef"],
//     xroster: json["xroster"],
//     xadminid: json["xadminid"],
//     xweekday: json["xweekday"],
//     xhdayapp: json["xhdayapp"],
//     xtaxzone: json["xtaxzone"],
//     xenddtcontract: json["xenddtcontract"],
//     xsuperior2: json["xsuperior2"],
//     xsuperior3: json["xsuperior3"],
//     xsuperior4: json["xsuperior4"],
//     xsuperior5: json["xsuperior5"],
//     xsuperior6: json["xsuperior6"],
//     xstatus1: json["xstatus1"],
//     xstatus2: json["xstatus2"],
//     xstatus3: json["xstatus3"],
//     xwkndnotapp: json["xwkndnotapp"],
//     xfdesignation: json["xfdesignation"],
//     xnote1: json["xnote1"],
//     xnote2: json["xnote2"],
//     xbonusnotapp: json["xbonusnotapp"],
//
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "ztime": ztime.toJson(),
//     "zutime": zutime.toJson(),
//     "zid": zid,
//     "zemail": zemail,
//     "xpassword": xpassword,
//     "xaccess": xaccess,
//     "xdformat": xdformat,
//     "xdsep": xdsep,
//     "zactive": zactive,
//     "zauserid": zauserid,
//     "zuuserid": zuuserid,
//     "xlastlogdate": xlastlogdate.toJson(),
//     "xname": xname,
//     "zaip": zaip,
//     "zuip": zuip,
//     "xwh": xwh,
//     "xsp": xsp,
//     "xrole": xrole,
//     "xoldpass": xoldpass,
//     "xposition": xposition,
//     "zscreen": zscreen,
//     "xposition": xposition,
//     "ztime": ztime.toJson(),
//     "zutime": zutime.toJson(),
//     "zauserid": zauserid,
//     "zuuserid": zuuserid,
//     "zid": zid,
//     "xstaff": xstaff,
//     "xname": xname,
//     "xfname": xfname,
//     "xmname": xmname,
//     "xmadd": xmadd,
//     "xpadd": xpadd,
//     "xbirthdate": xbirthdate.toJson(),
//     "xsex": xsex,
//     "xmstat": xmstat,
//     "xgroup": xgroup,
//     "xdeptname": xdeptname,
//     "xsec": xsec,
//     "xdesignation": xdesignation,
//     "xdatejoin": xdatejoin.toJson(),
//     "xgrade": xgrade,
//     "xbasic": xbasic,
//     "xhrent": xhrent,
//     "xmedical": xmedical,
//     "xconveyance": xconveyance,
//     "xemail": xemail,
//     "xenddate": xenddate,
//     "xretdate": xretdate.toJson(),
//     "xempstatus": xempstatus,
//     "xlocation": xlocation,
//     "xtaxamt": xtaxamt,
//     "xpfamount": xpfamount,
//     "xdistrict": xdistrict,
//     "xdatecom": xdatecom.toJson(),
//     "xinvamt": xinvamt,
//     "xamount": xamount,
//     "xdeduction": xdeduction,
//     "xinclude": xinclude,
//     "xnightallowance": xnightallowance,
//     "xshoeallowance": xshoeallowance,
//     "xbank": xbank,
//     "xdesc": xdesc,
//     "xacc": xacc,
//     "xhaccomodation": xhaccomodation,
//     "xtin": xtin,
//     "xempcategory": xempcategory,
//     "xstatus": xstatus,
//     "xbatch": xbatch,
//     "xsid": xsid,
//     "ximage": ximage,
//     "xbloodgroup": xbloodgroup,
//     "xphone": xphone,
//     "xhrc1": xhrc1,
//     "xhrc2": xhrc2,
//     "xhrc3": xhrc3,
//     "xhrc4": xhrc4,
//     "xplan": xplan,
//     "xcar": xcar,
//     "xlyearti": xlyearti,
//     "xgross": xgross,
//     "xhour": xhour,
//     "xrate": xrate,
//     "xsplan": xsplan,
//     "xemname": xemname,
//     "xrelation": xrelation,
//     "xemcmobile": xemcmobile,
//     "xmobile": xmobile,
//     "xdeptdesc": xdeptdesc,
//     "xcatdesc": xcatdesc,
//     "xnimage": xnimage,
//     "xreligion": xreligion,
//     "xemptype": xemptype,
//     "zactive": zactive,
//     "xsignature": xsignature,
//     "xfile": xfile,
//     "xidsup": xidsup,
//     "xsuperiorsp": xsuperiorsp,
//     "xsuperiorpo": xsuperiorpo,
//     "xsuperiorgl": xsuperiorgl,
//     "xsuperiorcs": xsuperiorcs,
//     "xsuperiorcnf": xsuperiorcnf,
//     "xsuperioradj": xsuperioradj,
//     "xsuperiorapn": xsuperiorapn,
//     "xempposition": xempposition,
//     "xsuperiorcnfbl": xsuperiorcnfbl,
//     "xgrossold": xgrossold,
//     "xsignatory": xsignatory,
//     "xrouting": xrouting,
//     "xacctype": xacctype,
//     "xempbank": xempbank,
//     "xsuperioradv": xsuperioradv,
//     "xsuperiorpaf": xsuperiorpaf,
//     "xsuperioreadj": xsuperioreadj,
//     "xsuperiorerq": xsuperiorerq,
//     "xsuperiorcash": xsuperiorcash,
//     "xemailc": xemailc,
//     "xfstname": xfstname,
//     "xlstname": xlstname,
//     "xbankamt": xbankamt,
//     "xcashamt": xcashamt,
//     "xempgrade": xempgrade,
//     "xsection": xsection,
//     "xshift": xshift,
//     "xemptimein": xemptimein,
//     "xemptimeout": xemptimeout,
//     "xpfconrate": xpfconrate,
//     "xpfdef": xpfdef,
//     "xitdef": xitdef,
//     "xroster": xroster,
//     "xadminid": xadminid,
//     "xweekday": xweekday,
//     "xhdayapp": xhdayapp,
//     "xtaxzone": xtaxzone,
//     "xenddtcontract": xenddtcontract,
//     "xsuperior2": xsuperior2,
//     "xsuperior3": xsuperior3,
//     "xsuperior4": xsuperior4,
//     "xsuperior5": xsuperior5,
//     "xsuperior6": xsuperior6,
//     "xstatus1": xstatus1,
//     "xstatus2": xstatus2,
//     "xstatus3": xstatus3,
//     "xwkndnotapp": xwkndnotapp,
//     "xfdesignation": xfdesignation,
//     "xnote1": xnote1,
//     "xnote2": xnote2,
//     "xbonusnotapp": xbonusnotapp,
//     "zemail": zemail,
//     "xpassword": xpassword,
//     "xaccess": xaccess,
//     "xdformat": xdformat,
//     "xdsep": xdsep,
//     "xlastlogdate": xlastlogdate.toJson(),
//     "zaip": zaip,
//     "zuip": zuip,
//     "xwh": xwh,
//     "xsp": xsp,
//     "xrole": xrole,
//     "xoldpass": xoldpass,
//     "zscreen": zscreen,
//   };
// }
//
// class Xlastlogdate {
//   Xlastlogdate({
//     required this.date,
//     required this.timezoneType,
//     required this.timezone,
//   });
//
//   DateTime date;
//   int timezoneType;
//   dynamic timezone;
//
//   factory Xlastlogdate.fromJson(Map<dynamic, dynamic> json) => Xlastlogdate(
//     date: DateTime.parse(json["date"]),
//     timezoneType: json["timezone_type"],
//     timezone: json["timezone"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "date": date.toIso8601dynamic(),
//     "timezone_type": timezoneType,
//     "timezone": timezone,
//   };
// }
//
// class Xbirthdate {
//   Xbirthdate({
//     required this.date,
//     required this.timezoneType,
//     required this.timezone,
//   });
//
//   DateTime date;
//   int timezoneType;
//   dynamic timezone;
//
//   factory Xbirthdate.fromJson(Map<dynamic, dynamic> json) => Xbirthdate(
//     date: DateTime.parse(json["date"]),
//     timezoneType: json["timezone_type"],
//     timezone: json["timezone"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "date": date.toIso8601dynamic(),
//     "timezone_type": timezoneType,
//     "timezone": timezone,
//   };
// }

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsondynamic);
//
// import 'dart:convert';
//
// LoginModel loginModelFromJson(dynamic str) => LoginModel.fromJson(json.decode(str));
//
// dynamic loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
// class LoginModel {
//   LoginModel({
//    required this.ztime,
//    required this.zutime,
//    required this.zauserid,
//    required this.zuuserid,
//    required this.zid,
//    required this.xstaff,
//    required this.xname,
//    required this.xfname,
//    required this.xmname,
//    required this.xmadd,
//    required this.xpadd,
//    required this.xbirthdate,
//    required this.xsex,
//    required this.xmstat,
//    required this.xgroup,
//    required this.xdeptname,
//    required this.xsec,
//    required this.xdesignation,
//    required this.xdatejoin,
//    required this.xgrade,
//    required this.xbasic,
//    required this.xhrent,
//    required this.xmedical,
//    required this.xconveyance,
//    required this.xemail,
//    required this.xenddate,
//    required this.xretdate,
//    required this.xempstatus,
//    required this.xlocation,
//    required this.xtaxamt,
//    required this.xpfamount,
//    required this.xdistrict,
//    required this.xdatecom,
//    required this.xinvamt,
//    required this.xamount,
//    required this.xdeduction,
//    required this.xinclude,
//    required this.xnightallowance,
//    required this.xshoeallowance,
//    required this.xbank,
//    required this.xdesc,
//    required this.xacc,
//    required this.xhaccomodation,
//    required this.xposition,
//    required this.xtin,
//    required this.xempcategory,
//    required this.xstatus,
//    required this.xbatch,
//    required this.xsid,
//    required this.ximage,
//    required this.xbloodgroup,
//    required this.xphone,
//    required this.xhrc1,
//    required this.xhrc2,
//    required this.xhrc3,
//    required this.xhrc4,
//    required this.xplan,
//    required this.xcar,
//    required this.xlyearti,
//    required this.xgross,
//    required this.xhour,
//    required this.xrate,
//    required this.xsplan,
//    required this.xemname,
//    required this.xrelation,
//    required this.xemcmobile,
//    required this.xmobile,
//    required this.xdeptdesc,
//    required this.xcatdesc,
//    required this.xnimage,
//    required this.xreligion,
//    required this.xemptype,
//    required this.zactive,
//    required this.xsignature,
//    required this.xfile,
//    required this.xidsup,
//    required this.xsuperiorsp,
//    required this.xsuperiorpo,
//    required this.xsuperiorgl,
//    required this.xsuperiorcs,
//    required this.xsuperiorcnf,
//    required this.xsuperioradj,
//    required this.xsuperiorapn,
//    required this.xempposition,
//    required this.xsuperiorcnfbl,
//    required this.xgrossold,
//    required this.xsignatory,
//    required this.xrouting,
//    required this.xacctype,
//    required this.xempbank,
//    required this.xsuperioradv,
//    required this.xsuperiorpaf,
//    required this.xsuperioreadj,
//    required this.xsuperiorerq,
//    required this.xsuperiorcash,
//    required this.xemailc,
//    required this.xfstname,
//    required this.xlstname,
//    required this.xbankamt,
//    required this.xcashamt,
//    required this.xempgrade,
//    required this.xsection,
//    required this.xshift,
//    required this.xemptimein,
//    required this.xemptimeout,
//    required this.xpfconrate,
//    required this.xpfdef,
//    required this.xitdef,
//    required this.xroster,
//    required this.xadminid,
//    required this.xweekday,
//    required this.xhdayapp,
//    required this.xtaxzone,
//    required this.xenddtcontract,
//    required this.xsuperior2,
//    required this.xsuperior3,
//    required this.xsuperior4,
//    required this.xsuperior5,
//    required this.xsuperior6,
//    required this.xstatus1,
//    required this.xstatus2,
//    required this.xstatus3,
//    required this.xwkndnotapp,
//    required this.xfdesignation,
//    required this.xnote1,
//    required this.xnote2,
//    required this.xbonusnotapp,
//    required this.zemail,
//    required this.xpassword,
//    required this.xaccess,
//    required this.xdformat,
//    required this.xdsep,
//    required this.xlastlogdate,
//    required this.zaip,
//    required this.zuip,
//    required this.xwh,
//    required this.xsp,
//    required this.xrole,
//    required this.xoldpass,
//    required this.zscreen,
//   });
//
//   Xbirthdate ztime;
//   dynamic zutime;
//   dynamic zauserid;
//   dynamic zuuserid;
//   int zid;
//   dynamic xstaff;
//   dynamic xname;
//   dynamic xfname;
//   dynamic xmname;
//   dynamic xmadd;
//   dynamic xpadd;
//   Xbirthdate xbirthdate;
//   dynamic xsex;
//   dynamic xmstat;
//   dynamic xgroup;
//   dynamic xdeptname;
//   dynamic xsec;
//   dynamic xdesignation;
//   Xbirthdate xdatejoin;
//   dynamic xgrade;
//   dynamic xbasic;
//   dynamic xhrent;
//   dynamic xmedical;
//   dynamic xconveyance;
//   dynamic xemail;
//   Xbirthdate xenddate;
//   Xbirthdate xretdate;
//   dynamic xempstatus;
//   dynamic xlocation;
//   dynamic xtaxamt;
//   dynamic xpfamount;
//   dynamic xdistrict;
//   Xbirthdate xdatecom;
//   dynamic xinvamt;
//   dynamic xamount;
//   dynamic xdeduction;
//   dynamic xinclude;
//   dynamic xnightallowance;
//   dynamic xshoeallowance;
//   dynamic xbank;
//   dynamic xdesc;
//   dynamic xacc;
//   dynamic xhaccomodation;
//   dynamic xposition;
//   dynamic xtin;
//   dynamic xempcategory;
//   dynamic xstatus;
//   dynamic xbatch;
//   dynamic xsid;
//   dynamic ximage;
//   dynamic xbloodgroup;
//   dynamic xphone;
//   dynamic xhrc1;
//   dynamic xhrc2;
//   dynamic xhrc3;
//   dynamic xhrc4;
//   dynamic xplan;
//   dynamic xcar;
//   dynamic xlyearti;
//   dynamic xgross;
//   dynamic xhour;
//   dynamic xrate;
//   dynamic xsplan;
//   dynamic xemname;
//   dynamic xrelation;
//   dynamic xemcmobile;
//   dynamic xmobile;
//   dynamic xdeptdesc;
//   dynamic xcatdesc;
//   dynamic xnimage;
//   dynamic xreligion;
//   dynamic xemptype;
//   dynamic zactive;
//   dynamic xsignature;
//   dynamic xfile;
//   dynamic xidsup;
//   dynamic xsuperiorsp;
//   dynamic xsuperiorpo;
//   dynamic xsuperiorgl;
//   dynamic xsuperiorcs;
//   dynamic xsuperiorcnf;
//   dynamic xsuperioradj;
//   dynamic xsuperiorapn;
//   dynamic xempposition;
//   dynamic xsuperiorcnfbl;
//   dynamic xgrossold;
//   dynamic xsignatory;
//   dynamic xrouting;
//   dynamic xacctype;
//   dynamic xempbank;
//   dynamic xsuperioradv;
//   dynamic xsuperiorpaf;
//   dynamic xsuperioreadj;
//   dynamic xsuperiorerq;
//   dynamic xsuperiorcash;
//   dynamic xemailc;
//   dynamic xfstname;
//   dynamic xlstname;
//   dynamic xbankamt;
//   dynamic xcashamt;
//   dynamic xempgrade;
//   dynamic xsection;
//   dynamic xshift;
//   dynamic xemptimein;
//   dynamic xemptimeout;
//   dynamic xpfconrate;
//   dynamic xpfdef;
//   dynamic xitdef;
//   dynamic xroster;
//   dynamic xadminid;
//   dynamic xweekday;
//   dynamic xhdayapp;
//   dynamic xtaxzone;
//   Xbirthdate xenddtcontract;
//   dynamic xsuperior2;
//   dynamic xsuperior3;
//   dynamic xsuperior4;
//   dynamic xsuperior5;
//   dynamic xsuperior6;
//   dynamic xstatus1;
//   dynamic xstatus2;
//   dynamic xstatus3;
//   dynamic xwkndnotapp;
//   dynamic xfdesignation;
//   dynamic xnote1;
//   dynamic xnote2;
//   dynamic xbonusnotapp;
//   dynamic zemail;
//   dynamic xpassword;
//   dynamic xaccess;
//   dynamic xdformat;
//   dynamic xdsep;
//   Xbirthdate xlastlogdate;
//   dynamic zaip;
//   dynamic zuip;
//   dynamic xwh;
//   dynamic xsp;
//   dynamic xrole;
//   dynamic xoldpass;
//   dynamic zscreen;
//
//   factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
//     ztime: Xbirthdate.fromJson(json["ztime"]),
//     zutime: json["zutime"],
//     zauserid: json["zauserid"],
//     zuuserid: json["zuuserid"],
//     zid: json["zid"],
//     xstaff: json["xstaff"],
//     xname: json["xname"],
//     xfname: json["xfname"],
//     xmname: json["xmname"],
//     xmadd: json["xmadd"],
//     xpadd: json["xpadd"],
//     xbirthdate: Xbirthdate.fromJson(json["xbirthdate"]),
//     xsex: json["xsex"],
//     xmstat: json["xmstat"],
//     xgroup: json["xgroup"],
//     xdeptname: json["xdeptname"],
//     xsec: json["xsec"],
//     xdesignation: json["xdesignation"],
//     xdatejoin: Xbirthdate.fromJson(json["xdatejoin"]),
//     xgrade: json["xgrade"],
//     xbasic: json["xbasic"],
//     xhrent: json["xhrent"],
//     xmedical: json["xmedical"],
//     xconveyance: json["xconveyance"],
//     xemail: json["xemail"],
//     xenddate: Xbirthdate.fromJson(json["xenddate"]),
//     xretdate: Xbirthdate.fromJson(json["xretdate"]),
//     xempstatus: json["xempstatus"],
//     xlocation: json["xlocation"],
//     xtaxamt: json["xtaxamt"],
//     xpfamount: json["xpfamount"],
//     xdistrict: json["xdistrict"],
//     xdatecom: Xbirthdate.fromJson(json["xdatecom"]),
//     xinvamt: json["xinvamt"],
//     xamount: json["xamount"],
//     xdeduction: json["xdeduction"],
//     xinclude: json["xinclude"],
//     xnightallowance: json["xnightallowance"],
//     xshoeallowance: json["xshoeallowance"],
//     xbank: json["xbank"],
//     xdesc: json["xdesc"],
//     xacc: json["xacc"],
//     xhaccomodation: json["xhaccomodation"],
//     xposition: json["xposition"],
//     xtin: json["xtin"],
//     xempcategory: json["xempcategory"],
//     xstatus: json["xstatus"],
//     xbatch: json["xbatch"],
//     xsid: json["xsid"],
//     ximage: json["ximage"],
//     xbloodgroup: json["xbloodgroup"],
//     xphone: json["xphone"],
//     xhrc1: json["xhrc1"],
//     xhrc2: json["xhrc2"],
//     xhrc3: json["xhrc3"],
//     xhrc4: json["xhrc4"],
//     xplan: json["xplan"],
//     xcar: json["xcar"],
//     xlyearti: json["xlyearti"],
//     xgross: json["xgross"],
//     xhour: json["xhour"],
//     xrate: json["xrate"],
//     xsplan: json["xsplan"],
//     xemname: json["xemname"],
//     xrelation: json["xrelation"],
//     xemcmobile: json["xemcmobile"],
//     xmobile: json["xmobile"],
//     xdeptdesc: json["xdeptdesc"],
//     xcatdesc: json["xcatdesc"],
//     xnimage: json["xnimage"],
//     xreligion: json["xreligion"],
//     xemptype: json["xemptype"],
//     zactive: json["zactive"],
//     xsignature: json["xsignature"],
//     xfile: json["xfile"],
//     xidsup: json["xidsup"],
//     xsuperiorsp: json["xsuperiorsp"],
//     xsuperiorpo: json["xsuperiorpo"],
//     xsuperiorgl: json["xsuperiorgl"],
//     xsuperiorcs: json["xsuperiorcs"],
//     xsuperiorcnf: json["xsuperiorcnf"],
//     xsuperioradj: json["xsuperioradj"],
//     xsuperiorapn: json["xsuperiorapn"],
//     xempposition: json["xempposition"],
//     xsuperiorcnfbl: json["xsuperiorcnfbl"],
//     xgrossold: json["xgrossold"],
//     xsignatory: json["xsignatory"],
//     xrouting: json["xrouting"],
//     xacctype: json["xacctype"],
//     xempbank: json["xempbank"],
//     xsuperioradv: json["xsuperioradv"],
//     xsuperiorpaf: json["xsuperiorpaf"],
//     xsuperioreadj: json["xsuperioreadj"],
//     xsuperiorerq: json["xsuperiorerq"],
//     xsuperiorcash: json["xsuperiorcash"],
//     xemailc: json["xemailc"],
//     xfstname: json["xfstname"],
//     xlstname: json["xlstname"],
//     xbankamt: json["xbankamt"],
//     xcashamt: json["xcashamt"],
//     xempgrade: json["xempgrade"],
//     xsection: json["xsection"],
//     xshift: json["xshift"],
//     xemptimein: json["xemptimein"],
//     xemptimeout: json["xemptimeout"],
//     xpfconrate: json["xpfconrate"],
//     xpfdef: json["xpfdef"],
//     xitdef: json["xitdef"],
//     xroster: json["xroster"],
//     xadminid: json["xadminid"],
//     xweekday: json["xweekday"],
//     xhdayapp: json["xhdayapp"],
//     xtaxzone: json["xtaxzone"],
//     xenddtcontract: Xbirthdate.fromJson(json["xenddtcontract"]),
//     xsuperior2: json["xsuperior2"],
//     xsuperior3: json["xsuperior3"],
//     xsuperior4: json["xsuperior4"],
//     xsuperior5: json["xsuperior5"],
//     xsuperior6: json["xsuperior6"],
//     xstatus1: json["xstatus1"],
//     xstatus2: json["xstatus2"],
//     xstatus3: json["xstatus3"],
//     xwkndnotapp: json["xwkndnotapp"],
//     xfdesignation: json["xfdesignation"],
//     xnote1: json["xnote1"],
//     xnote2: json["xnote2"],
//     xbonusnotapp: json["xbonusnotapp"],
//     zemail: json["zemail"],
//     xpassword: json["xpassword"],
//     xaccess: json["xaccess"],
//     xdformat: json["xdformat"],
//     xdsep: json["xdsep"],
//     xlastlogdate: Xbirthdate.fromJson(json["xlastlogdate"]),
//     zaip: json["zaip"],
//     zuip: json["zuip"],
//     xwh: json["xwh"],
//     xsp: json["xsp"],
//     xrole: json["xrole"],
//     xoldpass: json["xoldpass"],
//     zscreen: json["zscreen"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "ztime": ztime.toJson(),
//     "zutime": zutime,
//     "zauserid": zauserid,
//     "zuuserid": zuuserid,
//     "zid": zid,
//     "xstaff": xstaff,
//     "xname": xname,
//     "xfname": xfname,
//     "xmname": xmname,
//     "xmadd": xmadd,
//     "xpadd": xpadd,
//     "xbirthdate": xbirthdate.toJson(),
//     "xsex": xsex,
//     "xmstat": xmstat,
//     "xgroup": xgroup,
//     "xdeptname": xdeptname,
//     "xsec": xsec,
//     "xdesignation": xdesignation,
//     "xdatejoin": xdatejoin.toJson(),
//     "xgrade": xgrade,
//     "xbasic": xbasic,
//     "xhrent": xhrent,
//     "xmedical": xmedical,
//     "xconveyance": xconveyance,
//     "xemail": xemail,
//     "xenddate": xenddate.toJson(),
//     "xretdate": xretdate.toJson(),
//     "xempstatus": xempstatus,
//     "xlocation": xlocation,
//     "xtaxamt": xtaxamt,
//     "xpfamount": xpfamount,
//     "xdistrict": xdistrict,
//     "xdatecom": xdatecom.toJson(),
//     "xinvamt": xinvamt,
//     "xamount": xamount,
//     "xdeduction": xdeduction,
//     "xinclude": xinclude,
//     "xnightallowance": xnightallowance,
//     "xshoeallowance": xshoeallowance,
//     "xbank": xbank,
//     "xdesc": xdesc,
//     "xacc": xacc,
//     "xhaccomodation": xhaccomodation,
//     "xposition": xposition,
//     "xtin": xtin,
//     "xempcategory": xempcategory,
//     "xstatus": xstatus,
//     "xbatch": xbatch,
//     "xsid": xsid,
//     "ximage": ximage,
//     "xbloodgroup": xbloodgroup,
//     "xphone": xphone,
//     "xhrc1": xhrc1,
//     "xhrc2": xhrc2,
//     "xhrc3": xhrc3,
//     "xhrc4": xhrc4,
//     "xplan": xplan,
//     "xcar": xcar,
//     "xlyearti": xlyearti,
//     "xgross": xgross,
//     "xhour": xhour,
//     "xrate": xrate,
//     "xsplan": xsplan,
//     "xemname": xemname,
//     "xrelation": xrelation,
//     "xemcmobile": xemcmobile,
//     "xmobile": xmobile,
//     "xdeptdesc": xdeptdesc,
//     "xcatdesc": xcatdesc,
//     "xnimage": xnimage,
//     "xreligion": xreligion,
//     "xemptype": xemptype,
//     "zactive": zactive,
//     "xsignature": xsignature,
//     "xfile": xfile,
//     "xidsup": xidsup,
//     "xsuperiorsp": xsuperiorsp,
//     "xsuperiorpo": xsuperiorpo,
//     "xsuperiorgl": xsuperiorgl,
//     "xsuperiorcs": xsuperiorcs,
//     "xsuperiorcnf": xsuperiorcnf,
//     "xsuperioradj": xsuperioradj,
//     "xsuperiorapn": xsuperiorapn,
//     "xempposition": xempposition,
//     "xsuperiorcnfbl": xsuperiorcnfbl,
//     "xgrossold": xgrossold,
//     "xsignatory": xsignatory,
//     "xrouting": xrouting,
//     "xacctype": xacctype,
//     "xempbank": xempbank,
//     "xsuperioradv": xsuperioradv,
//     "xsuperiorpaf": xsuperiorpaf,
//     "xsuperioreadj": xsuperioreadj,
//     "xsuperiorerq": xsuperiorerq,
//     "xsuperiorcash": xsuperiorcash,
//     "xemailc": xemailc,
//     "xfstname": xfstname,
//     "xlstname": xlstname,
//     "xbankamt": xbankamt,
//     "xcashamt": xcashamt,
//     "xempgrade": xempgrade,
//     "xsection": xsection,
//     "xshift": xshift,
//     "xemptimein": xemptimein,
//     "xemptimeout": xemptimeout,
//     "xpfconrate": xpfconrate,
//     "xpfdef": xpfdef,
//     "xitdef": xitdef,
//     "xroster": xroster,
//     "xadminid": xadminid,
//     "xweekday": xweekday,
//     "xhdayapp": xhdayapp,
//     "xtaxzone": xtaxzone,
//     "xenddtcontract": xenddtcontract.toJson(),
//     "xsuperior2": xsuperior2,
//     "xsuperior3": xsuperior3,
//     "xsuperior4": xsuperior4,
//     "xsuperior5": xsuperior5,
//     "xsuperior6": xsuperior6,
//     "xstatus1": xstatus1,
//     "xstatus2": xstatus2,
//     "xstatus3": xstatus3,
//     "xwkndnotapp": xwkndnotapp,
//     "xfdesignation": xfdesignation,
//     "xnote1": xnote1,
//     "xnote2": xnote2,
//     "xbonusnotapp": xbonusnotapp,
//     "zemail": zemail,
//     "xpassword": xpassword,
//     "xaccess": xaccess,
//     "xdformat": xdformat,
//     "xdsep": xdsep,
//     "xlastlogdate": xlastlogdate.toJson(),
//     "zaip": zaip,
//     "zuip": zuip,
//     "xwh": xwh,
//     "xsp": xsp,
//     "xrole": xrole,
//     "xoldpass": xoldpass,
//     "zscreen": zscreen,
//   };
// }
//
// class Xbirthdate {
//   Xbirthdate({
//    required this.date,
//    required this.timezoneType,
//    required this.timezone,
//   });
//
//   DateTime date;
//   int timezoneType;
//   dynamic timezone;
//
//   factory Xbirthdate.fromJson(Map<dynamic, dynamic> json) => Xbirthdate(
//     date: DateTime.parse(json["date"]),
//     timezoneType: json["timezone_type"],
//     timezone: json["timezone"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "date": date.toIso8601String(),
//     "timezone_type": timezoneType,
//     "timezone": timezone,
//   };
// }
//

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);
//
// main model
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel(
      {required this.xname,
      required this.xstaff,
      required this.xdeptname,
      required this.xposition,
      required this.zemail,
      required this.xpassword,
      required this.xdesignation,
      required this.xsid,
      required this.xempbank,
      required this.xacc,
      required this.xsex,
      required this.xempcategory,
      required this.supname,
      required this.xrole});

  dynamic xname;
  dynamic xstaff;
  dynamic xdeptname;
  dynamic xposition;
  dynamic zemail;
  dynamic xpassword;
  dynamic xdesignation;
  dynamic xsid;
  dynamic xempbank;
  dynamic xacc;
  dynamic xsex;
  dynamic xempcategory;
  dynamic supname;
  dynamic xrole;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      xname: json["xname"],
      xstaff: json["xstaff"],
      xdeptname: json["xdeptname"],
      xposition: json["xposition"],
      zemail: json["zemail"],
      xpassword: json["xpassword"],
      xdesignation: json["xdesignation"],
      xsid: json["xsid"],
      xempbank: json["xempbank"],
      xacc: json["xacc"],
      xsex: json["xsex"],
      xempcategory: json["xempcategory"],
      supname: json["supname"],
      xrole: json["xrole"]);

  Map<String, dynamic> toJson() => {
        "xname": xname,
        "xstaff": xstaff,
        "xdeptname": xdeptname,
        "xposition": xposition,
        "zemail": zemail,
        "xpassword": xpassword,
        "xdesignation": xdesignation,
        "xsid": xsid,
        "xempbank": xempbank,
        "xacc": xacc,
        "xsex": xsex,
        "xempcategory": xempcategory,
        "supname": supname,
        "xrole": xrole
      };
}

// //test model
// // To parse this JSON data, do
// //
// //     final loginModel = loginModelFromJson(jsonString);
//
// import 'dart:convert';
//
// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));
//
// String loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
// class LoginModel {
//   LoginModel({
//     required this.xname,
//     required this.xstaff,
//     required this.xdeptname,
//     required this.xposition,
//     required this.xempbank,
//     required this.xacc,
//     required this.xsex,
//     required this.xempcategory,
//     required this.xrole,
//     required this.zemail,
//     required this.xpassword,
//     required this.xdesignation,
//     required this.xsid,
//     required this.supname,
//   });
//
//   dynamic xname;
//   dynamic xstaff;
//   dynamic xdeptname;
//   dynamic xposition;
//   dynamic xempbank;
//   dynamic xacc;
//   dynamic xsex;
//   dynamic xempcategory;
//   dynamic xrole;
//   dynamic zemail;
//   dynamic xpassword;
//   dynamic xdesignation;
//   dynamic xsid;
//   dynamic supname;
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         xname: json["xname"],
//         xstaff: json["xstaff"],
//         xdeptname: json["xdeptname"],
//         xposition: json["xposition"],
//         xempbank: json["xempbank"],
//         xacc: json["xacc"],
//         xsex: json["xsex"],
//         xempcategory: json["xempcategory"],
//         xrole: json["xrole"],
//         zemail: json["zemail"],
//         xpassword: json["xpassword"],
//         xdesignation: json["xdesignation"],
//         xsid: json["xsid"],
//         supname: json["supname"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "xname": xname,
//         "xstaff": xstaff,
//         "xdeptname": xdeptname,
//         "xposition": xposition,
//         "xempbank": xempbank,
//         "xacc": xacc,
//         "xsex": xsex,
//         "xempcategory": xempcategory,
//         "xrole": xrole,
//         "zemail": zemail,
//         "xpassword": xpassword,
//         "xdesignation": xdesignation,
//         "xsid": xsid,
//         "supname": supname,
//       };
// }
