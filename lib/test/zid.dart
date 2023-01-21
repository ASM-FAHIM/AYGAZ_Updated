// To parse this JSON data, do
//
//     final zidr = zidrFromJson(jsonString);

import 'dart:convert';

List<Zidr> zidrFromJson(String str) => List<Zidr>.from(json.decode(str).map((x) => Zidr.fromJson(x)));

String zidrToJson(List<Zidr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Zidr {
  Zidr({
    required this.zid,
  });

  int zid;

  factory Zidr.fromJson(Map<String, dynamic> json) => Zidr(
    zid: json["zid"],
  );

  Map<String, dynamic> toJson() => {
    "zid": zid,
  };
}
