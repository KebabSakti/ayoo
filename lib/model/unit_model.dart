// To parse this JSON data, do
//
//     final unitModel = unitModelFromJson(jsonString);

import 'dart:convert';

UnitModel unitModelFromJson(String str) => UnitModel.fromJson(json.decode(str));

String unitModelToJson(UnitModel data) => json.encode(data.toJson());

class UnitModel {
  UnitModel({
    this.id,
    this.unitId,
    this.amount,
    this.unit,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String unitId;
  String amount;
  String unit;
  DateTime createdAt;
  DateTime updatedAt;

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        id: json["id"],
        unitId: json["unit_id"],
        amount: json["amount"],
        unit: json["unit"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unit_id": unitId,
        "amount": amount,
        "unit": unit,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
