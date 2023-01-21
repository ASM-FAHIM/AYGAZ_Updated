// // To parse this JSON data, do
// //
// //     final leaveTourModel = leaveTourModelFromJson(jsonString);
//
// import 'dart:convert';
//
// LeaveTourModel dataModelFromJson(String str) => LeaveTourModel.fromJson(json.decode(str));
//
// List<LeaveTourModel> leaveTourModelFromJson(String str) => List<LeaveTourModel>.from(json.decode(str).map((x) => LeaveTourModel.fromJson(x)));
//
// String leaveTourModelToJson(List<LeaveTourModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// String dataModelToJson(LeaveTourModel data) => json.encode(data.toJson());
//
//
//
// class LeaveTourModel {
//   LeaveTourModel({
//     //required this.id,
//     required this.leaveType,
//     required this.fromDate,
//     required this.toDate,
//     required this.contactNumber,
//     required this.taskAssigntTo,
//     required this.reasonApplicaiton,
//     required this.status,
//    // required this.createdAt,
//   });
//
//  // String id;
//   String leaveType;
//   String fromDate;
//   String toDate;
//   String contactNumber;
//   String taskAssigntTo;
//   String reasonApplicaiton;
//   String status;
//   //DateTime createdAt;
//
//   factory LeaveTourModel.fromJson(Map<String, dynamic> json) => LeaveTourModel(
//     //id: json["id"],
//     leaveType: json["leaveType"],
//     fromDate: json["fromDate"],
//     toDate: json["toDate"],
//     contactNumber: json["contactNumber"],
//     taskAssigntTo: json["taskAssigntTo"],
//     reasonApplicaiton: json["reasonApplicaiton"],
//     //createdAt: DateTime.parse(json["created_at"]),
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     //"id": id,
//     "leaveType": leaveType,
//     "fromDate": fromDate,
//     "toDate": toDate,
//     "contactNumber": contactNumber,
//     "taskAssigntTo": taskAssigntTo,
//     "reasonApplicaiton": reasonApplicaiton,
//     //"created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
//     "status": status,
//   };
// }
//
//


// To parse this JSON data, do
//
//     final leaveTourModel = leaveTourModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<LeaveTourModel> leaveTourModelFromJson(String str) => List<LeaveTourModel>.from(json.decode(str).map((x) => LeaveTourModel.fromJson(x)));
//
// String leaveTourModelToJson(List<LeaveTourModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class LeaveTourModel {
//   LeaveTourModel({
//     //this.id,
//     required this.leaveType,
//     required this.fromDate,
//     required this.toDate,
//     required this.contactNumber,
//     required this.taskAssigntTo,
//     required this.reasonApplicaiton,
//     required this.aprovalstatus,
//     //this.createdAt,
//   });
//
//   //String id;
//   String leaveType;
//   String fromDate;
//   String toDate;
//   String contactNumber;
//   String taskAssigntTo;
//   String reasonApplicaiton;
//   String aprovalstatus;
//   //DateTime createdAt;
//
//   factory LeaveTourModel.fromJson(Map<String, dynamic> json) => LeaveTourModel(
//     //id: json["id"],
//     leaveType: json["leaveType"],
//     fromDate: json["fromDate"],
//     toDate: json["toDate"],
//     contactNumber: json["contactNumber"],
//     taskAssigntTo: json["taskAssigntTo"],
//     reasonApplicaiton: json["reasonApplicaiton"],
//     aprovalstatus: json["aprovalstatus"],
//     //createdAt: DateTime.parse(json["created_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     //"id": id,
//     "leaveType": leaveType,
//     "fromDate": fromDate,
//     "toDate": toDate,
//     "contactNumber": contactNumber,
//     "taskAssigntTo": taskAssigntTo,
//     "reasonApplicaiton": reasonApplicaiton,
//     "aprovalstatus": aprovalstatus,
//     //"created_at": createdAt.toIso8601String(),
//   };
// }



// To parse this JSON data, do
//
//     final leaveandTour = leaveandTourFromJson(jsonString);
//
// import 'dart:convert';
//
// List<LeaveandTour> leaveandTourFromJson(String str) => List<LeaveandTour>.from(json.decode(str).map((x) => LeaveandTour.fromJson(x)));
//
// String leaveandTourToJson(List<LeaveandTour> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class LeaveandTour {
//   LeaveandTour({
//     required this.xposition,
//     required this.xstatus,
//     required this.xtypeleave,
//     required this.xdatefrom,
//     required this.xdateto,
//     required this.xavailable,
//     required this.xused,
//   });
//
//   String xposition;
//   String xstatus;
//   String xtypeleave;
//   Xdate xdatefrom;
//   Xdate xdateto;
//   String xavailable;
//   String xused;
//
//   factory LeaveandTour.fromJson(Map<String, dynamic> json) => LeaveandTour(
//     xposition: json["xposition"],
//     xstatus: json["xstatus"],
//     xtypeleave: json["xtypeleave"],
//     xdatefrom: Xdate.fromJson(json["xdatefrom"]),
//     xdateto: Xdate.fromJson(json["xdateto"]),
//     xavailable: json["xavailable"],
//     xused: json["xused"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "xposition": xposition,
//     "xstatus": xstatus,
//     "xtypeleave": xtypeleave,
//     "xdatefrom": xdatefrom.toJson(),
//     "xdateto": xdateto.toJson(),
//     "xavailable": xavailable,
//     "xused": xused,
//   };
// }
//
// class Xdate {
//   Xdate({
//     required this.date,
//     required this.timezoneType,
//     //required this.timezone,
//   });
//
//   DateTime date;
//   int timezoneType;
//   //Timezone timezone;
//
//   factory Xdate.fromJson(Map<String, dynamic> json) => Xdate(
//     date: DateTime.parse(json["date"]),
//     timezoneType: json["timezone_type"],
//     //timezone: timezoneValues.map[json["timezone"]],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "date": date.toIso8601String(),
//     "timezone_type": timezoneType,
//     //"timezone": timezoneValues.reverse[timezone],
//   };
// }
//
//
//
//
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues({required this.map, required this.reverseMap});
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
//
//
//
//
//
// To parse this JSON data, do
//
//     final leaveandTourModel = leaveandTourModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final leaveandTourModel = leaveandTourModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final leaveandTourModel = leaveandTourModelFromJson(jsonString);

import 'dart:convert';

List<LeaveandTourModel> leaveandTourModelFromJson(String str) => List<LeaveandTourModel>.from(json.decode(str).map((x) => LeaveandTourModel.fromJson(x)));

String leaveandTourModelToJson(List<LeaveandTourModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveandTourModel {
  LeaveandTourModel({
    required this.xposition,
    required this.xstatus,
    required this.xtypeleave,
    required this.xdatefrom,
    required this.xdateto,
    // required this.xavailable,
    // required this.xused,
  });

  String xposition;
  String xstatus;
  String xtypeleave;
  Xdate xdatefrom;
  Xdate xdateto;
  // String xavailable;
  // String xused;

  factory LeaveandTourModel.fromJson(Map<String, dynamic> json) => LeaveandTourModel(
    xposition: json["xposition"],
    xstatus: json["xstatus"],
    xtypeleave: json["xtypeleave"],
    xdatefrom: Xdate.fromJson(json["xdatefrom"]),
    xdateto: Xdate.fromJson(json["xdateto"]),
    // xavailable: json["xavailable"],
    // xused: json["xused"],
  );

  Map<String, dynamic> toJson() => {
    "xposition": xposition,
    "xstatus": xstatus,
    "xtypeleave": xtypeleave,
    "xdatefrom": xdatefrom.toJson(),
    "xdateto": xdateto.toJson(),
    // "xavailable": xavailable,
    // "xused": xused,
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

