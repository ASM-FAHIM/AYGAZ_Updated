// To parse this JSON data, do
//
//     final adminLateCount = adminLateCountFromJson(jsonString);

// To parse this JSON data, do
//
//     final csModel = csModelFromJson(jsonString);

import 'dart:convert';

CsModel csModelFromJson(String str) => CsModel.fromJson(json.decode(str));

String csModelToJson(CsModel data) => json.encode(data.toJson());

class CsModel {
  CsModel({
    required this.total,
  });

  int total;

  factory CsModel.fromJson(Map<String, dynamic> json) => CsModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//grn_count Model
// To parse this JSON data, do
//
//     final grnModel = grnModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final grnModel = grnModelFromJson(jsonString);

GrnModel grnModelFromJson(String str) => GrnModel.fromJson(json.decode(str));

String grnModelToJson(GrnModel data) => json.encode(data.toJson());

class GrnModel {
  GrnModel({
    required this.total,
  });

  int total;

  factory GrnModel.fromJson(Map<String, dynamic> json) => GrnModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending BOM model(BM)
// To parse this JSON data, do
//
//     final bomModel = bomModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final bomModel = bomModelFromJson(jsonString);

BomModel bomModelFromJson(String str) => BomModel.fromJson(json.decode(str));

String bomModelToJson(BomModel data) => json.encode(data.toJson());

class BomModel {
  BomModel({
    required this.total,
  });

  int total;

  factory BomModel.fromJson(Map<String, dynamic> json) => BomModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending_Batch(BAT)
// To parse this JSON data, do
//
//     final batModel = batModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final batModel = batModelFromJson(jsonString);

BatModel batModelFromJson(String str) => BatModel.fromJson(json.decode(str));

String batModelToJson(BatModel data) => json.encode(data.toJson());

class BatModel {
  BatModel({
    required this.total,
  });

  int total;

  factory BatModel.fromJson(Map<String, dynamic> json) => BatModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending invoice(DO)
// To parse this JSON data, do
//
//     final doModel = doModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final doModel = doModelFromJson(jsonString);

DoModel doModelFromJson(String str) => DoModel.fromJson(json.decode(str));

String doModelToJson(DoModel data) => json.encode(data.toJson());

class DoModel {
  DoModel({
    required this.total,
  });

  int total;

  factory DoModel.fromJson(Map<String, dynamic> json) => DoModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending purchase return(PRN)

// To parse this JSON data, do
//
//     final prnModel = prnModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final prnModel = prnModelFromJson(jsonString);

PrnModel prnModelFromJson(String str) => PrnModel.fromJson(json.decode(str));

String prnModelToJson(PrnModel data) => json.encode(data.toJson());

class PrnModel {
  PrnModel({
    required this.total,
  });

  int total;

  factory PrnModel.fromJson(Map<String, dynamic> json) => PrnModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Prnding pre process batch(BATP)
// To parse this JSON data, do
//
//     final batpModel = batpModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final batpModel = batpModelFromJson(jsonString);

BatpModel batpModelFromJson(String str) => BatpModel.fromJson(json.decode(str));

String batpModelToJson(BatpModel data) => json.encode(data.toJson());

class BatpModel {
  BatpModel({
    required this.total,
  });

  int total;

  factory BatpModel.fromJson(Map<String, dynamic> json) => BatpModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending Sales Order(SO)
// To parse this JSON data, do
//
//     final soModel = soModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final soModel = soModelFromJson(jsonString);

SoModel soModelFromJson(String str) => SoModel.fromJson(json.decode(str));

String soModelToJson(SoModel data) => json.encode(data.toJson());

class SoModel {
  SoModel({
    required this.total,
  });

  int total;

  factory SoModel.fromJson(Map<String, dynamic> json) => SoModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending Sales Return
// To parse this JSON data, do
//
//     final salesReturnModel = salesReturnModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final salesReturnModel = salesReturnModelFromJson(jsonString);

SalesReturnModel salesReturnModelFromJson(String str) =>
    SalesReturnModel.fromJson(json.decode(str));

String salesReturnModelToJson(SalesReturnModel data) =>
    json.encode(data.toJson());

class SalesReturnModel {
  SalesReturnModel({
    required this.total,
  });

  int total;

  factory SalesReturnModel.fromJson(Map<String, dynamic> json) =>
      SalesReturnModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending voucher
// To parse this JSON data, do
//
//     final pendingVoucherModel = pendingVoucherModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final pendingVoucherModel = pendingVoucherModelFromJson(jsonString);

PendingVoucherModel pendingVoucherModelFromJson(String str) =>
    PendingVoucherModel.fromJson(json.decode(str));

String pendingVoucherModelToJson(PendingVoucherModel data) =>
    json.encode(data.toJson());

class PendingVoucherModel {
  PendingVoucherModel({
    required this.total,
  });

  int total;

  factory PendingVoucherModel.fromJson(Map<String, dynamic> json) =>
      PendingVoucherModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending PO
// To parse this JSON data, do
//
//     final poModel = poModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final poModel = poModelFromJson(jsonString);

PoModel poModelFromJson(String str) => PoModel.fromJson(json.decode(str));

String poModelToJson(PoModel data) => json.encode(data.toJson());

class PoModel {
  PoModel({
    required this.total,
  });

  int total;

  factory PoModel.fromJson(Map<String, dynamic> json) => PoModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending pre process BOM(BMP)
// To parse this JSON data, do
//
//     final bmpModel = bmpModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final bmpModel = bmpModelFromJson(jsonString);

BmpModel bmpModelFromJson(String str) => BmpModel.fromJson(json.decode(str));

String bmpModelToJson(BmpModel data) => json.encode(data.toJson());

class BmpModel {
  BmpModel({
    required this.total,
  });

  int total;

  factory BmpModel.fromJson(Map<String, dynamic> json) => BmpModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending spot purchase advance(SPA)
// To parse this JSON data, do
//
//     final spaModel = spaModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final spaModel = spaModelFromJson(jsonString);

SpaModel spaModelFromJson(String str) => SpaModel.fromJson(json.decode(str));

String spaModelToJson(SpaModel data) => json.encode(data.toJson());

class SpaModel {
  SpaModel({
    required this.total,
  });

  int total;

  factory SpaModel.fromJson(Map<String, dynamic> json) => SpaModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//pending SPR
// To parse this JSON data, do
//
//     final sprModel = sprModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final sprModel = sprModelFromJson(jsonString);

SprModel sprModelFromJson(String str) => SprModel.fromJson(json.decode(str));

String sprModelToJson(SprModel data) => json.encode(data.toJson());

class SprModel {
  SprModel({
    required this.total,
  });

  int total;

  factory SprModel.fromJson(Map<String, dynamic> json) => SprModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//pending SQC
// To parse this JSON data, do
//
//     final sqcModel = sqcModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final sqcModel = sqcModelFromJson(jsonString);

SqcModel sqcModelFromJson(String str) => SqcModel.fromJson(json.decode(str));

String sqcModelToJson(SqcModel data) => json.encode(data.toJson());

class SqcModel {
  SqcModel({
    required this.total,
  });

  int total;

  factory SqcModel.fromJson(Map<String, dynamic> json) => SqcModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//Pending SR
// To parse this JSON data, do
//
//     final srModel = srModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final srModel = srModelFromJson(jsonString);

SrModel srModelFromJson(String str) => SrModel.fromJson(json.decode(str));

String srModelToJson(SrModel data) => json.encode(data.toJson());

class SrModel {
  SrModel({
    required this.total,
  });

  int total;

  factory SrModel.fromJson(Map<String, dynamic> json) => SrModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

//CusList_Count
// To parse this JSON data, do
//
//     final cusListCountModel = cusListCountModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final cusListCountModel = cusListCountModelFromJson(jsonString);

CusListCountModel cusListCountModelFromJson(String str) =>
    CusListCountModel.fromJson(json.decode(str));

String cusListCountModelToJson(CusListCountModel data) =>
    json.encode(data.toJson());

class CusListCountModel {
  CusListCountModel({
    required this.total,
  });

  int total;

  factory CusListCountModel.fromJson(Map<String, dynamic> json) =>
      CusListCountModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

// To parse this JSON data, do
//
//     final monReqApCountModel = monReqApCountModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final monReqCountModel = monReqCountModelFromJson(jsonString);

MonReqCountModel monReqCountModelFromJson(String str) =>
    MonReqCountModel.fromJson(json.decode(str));

String monReqCountModelToJson(MonReqCountModel data) =>
    json.encode(data.toJson());

class MonReqCountModel {
  MonReqCountModel({
    required this.total,
  });

  int total;

  factory MonReqCountModel.fromJson(Map<String, dynamic> json) =>
      MonReqCountModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

// To parse this JSON data, do
//
//     final monReqAdjCountModel = monReqAdjCountModelFromJson(jsonString);

MonReqAdjCountModel monReqAdjCountModelFromJson(String str) =>
    MonReqAdjCountModel.fromJson(json.decode(str));

String monReqAdjCountModelToJson(MonReqAdjCountModel data) =>
    json.encode(data.toJson());

class MonReqAdjCountModel {
  MonReqAdjCountModel({
    required this.total,
  });

  int total;

  factory MonReqAdjCountModel.fromJson(Map<String, dynamic> json) =>
      MonReqAdjCountModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

// To parse this JSON data, do
//
//     final dcCountModel = dcCountModelFromJson(jsonString);

DcCountModel dcCountModelFromJson(String str) =>
    DcCountModel.fromJson(json.decode(str));

String dcCountModelToJson(DcCountModel data) => json.encode(data.toJson());

class DcCountModel {
  DcCountModel({
    required this.total,
  });

  int total;

  factory DcCountModel.fromJson(Map<String, dynamic> json) => DcCountModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

// To parse this JSON data, do
//
//     final serviceNotifyCountModel = serviceNotifyCountModelFromJson(jsonString);

ServiceNotifyCountModel serviceNotifyCountModelFromJson(String str) =>
    ServiceNotifyCountModel.fromJson(json.decode(str));

String serviceNotifyCountModelToJson(ServiceNotifyCountModel data) =>
    json.encode(data.toJson());

class ServiceNotifyCountModel {
  ServiceNotifyCountModel({
    required this.total,
  });

  int total;

  factory ServiceNotifyCountModel.fromJson(Map<String, dynamic> json) =>
      ServiceNotifyCountModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

// To parse this JSON data, do
//
//     final supplierCountModel = supplierCountModelFromJson(jsonString);

SupplierCountModel supplierCountModelFromJson(String str) =>
    SupplierCountModel.fromJson(json.decode(str));

String supplierCountModelToJson(SupplierCountModel data) =>
    json.encode(data.toJson());

class SupplierCountModel {
  SupplierCountModel({
    required this.total,
  });

  int total;

  factory SupplierCountModel.fromJson(Map<String, dynamic> json) =>
      SupplierCountModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

// To parse this JSON data, do
//
//     final itemsCountModel = itemsCountModelFromJson(jsonString);

ItemsCountModel itemsCountModelFromJson(String str) =>
    ItemsCountModel.fromJson(json.decode(str));

String itemsCountModelToJson(ItemsCountModel data) =>
    json.encode(data.toJson());

class ItemsCountModel {
  ItemsCountModel({
    required this.total,
  });

  int total;

  factory ItemsCountModel.fromJson(Map<String, dynamic> json) =>
      ItemsCountModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}



// // To parse this JSON data, do
// //
// //     final absentCountModel = absentCountModelFromJson(jsonString);
//
// import 'dart:convert';

AbsentCountModel absentCountModelFromJson(String str) => AbsentCountModel.fromJson(json.decode(str));

String absentCountModelToJson(AbsentCountModel data) => json.encode(data.toJson());

class AbsentCountModel {
  AbsentCountModel({
    required this.total,
  });

  int total;

  factory AbsentCountModel.fromJson(Map<String, dynamic> json) => AbsentCountModel(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}

// To parse this JSON data, do
//
//     final leaveandTourCountModel = leaveandTourCountModelFromJson(jsonString);

// import 'dart:convert';

LeaveandTourCountModel leaveandTourCountModelFromJson(String str) => LeaveandTourCountModel.fromJson(json.decode(str));

String leaveandTourCountModelToJson(LeaveandTourCountModel data) => json.encode(data.toJson());

class LeaveandTourCountModel {
  LeaveandTourCountModel({
    required this.total,
  });

  int total;

  factory LeaveandTourCountModel.fromJson(Map<String, dynamic> json) => LeaveandTourCountModel(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}


// To parse this JSON data, do
//
//     final earlyCountModel = earlyCountModelFromJson(jsonString);

//import 'dart:convert';

EarlyCountModel earlyCountModelFromJson(String str) => EarlyCountModel.fromJson(json.decode(str));

String earlyCountModelToJson(EarlyCountModel data) => json.encode(data.toJson());

class EarlyCountModel {
  EarlyCountModel({
    required this.total,
  });

  int total;

  factory EarlyCountModel.fromJson(Map<String, dynamic> json) => EarlyCountModel(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}


// To parse this JSON data, do
//
//     final lateCountModel = lateCountModelFromJson(jsonString);

// import 'dart:convert';

LateCountModel lateCountModelFromJson(String str) => LateCountModel.fromJson(json.decode(str));

String lateCountModelToJson(LateCountModel data) => json.encode(data.toJson());

class LateCountModel {
  LateCountModel({
    required this.total,
  });

  int total;

  factory LateCountModel.fromJson(Map<String, dynamic> json) => LateCountModel(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}
