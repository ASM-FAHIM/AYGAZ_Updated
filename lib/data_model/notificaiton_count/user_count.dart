// To parse this JSON data, do
//
//     final userEarlyCount = userEarlyCountFromJson(jsonString);

import 'dart:convert';

UserEarlyCount userEarlyCountFromJson(String str) => UserEarlyCount.fromJson(json.decode(str));

String userEarlyCountToJson(UserEarlyCount data) => json.encode(data.toJson());

class UserEarlyCount {
  UserEarlyCount({
    required this.total,
  });

  int total;

  factory UserEarlyCount.fromJson(Map<String, dynamic> json) => UserEarlyCount(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}



UserLateCount userLateCountFromJson(String str) => UserLateCount.fromJson(json.decode(str));

String userLateCountToJson(UserLateCount data) => json.encode(data.toJson());

class UserLateCount {
  UserLateCount({
    required this.total,
  });

  int total;

  factory UserLateCount.fromJson(Map<String, dynamic> json) => UserLateCount(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}




UserLeaveCount userLeaveCountFromJson(String str) => UserLeaveCount.fromJson(json.decode(str));

String userLeaveCountToJson(UserLeaveCount data) => json.encode(data.toJson());

class UserLeaveCount {
  UserLeaveCount({
    required this.total,
  });

  int total;

  factory UserLeaveCount.fromJson(Map<String, dynamic> json) => UserLeaveCount(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}



UserAbsentCount userAbsentCountFromJson(String str) => UserAbsentCount.fromJson(json.decode(str));

String userAbsentCountToJson(UserAbsentCount data) => json.encode(data.toJson());

class UserAbsentCount {
  UserAbsentCount({
    required this.total,
  });

  int total;

  factory UserAbsentCount.fromJson(Map<String, dynamic> json) => UserAbsentCount(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}

