// To parse this JSON data, do
//
//     final orderStatusModel = orderStatusModelFromJson(jsonString);

import 'dart:convert';

List<OrderStatusModel> orderStatusModelFromJson(String str) =>
    List<OrderStatusModel>.from(
        json.decode(str).map((x) => OrderStatusModel.fromJson(x)));

String orderStatusModelToJson(List<OrderStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderStatusModel {
  OrderStatusModel({
    this.id,
    this.saleStatusId,
    this.saleId,
    this.status,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String saleStatusId;
  String saleId;
  String status;
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  OrderStatusModel copyWith({
    int id,
    String saleStatusId,
    String saleId,
    String status,
    String note,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      OrderStatusModel(
        id: id ?? this.id,
        saleStatusId: saleStatusId ?? this.saleStatusId,
        saleId: saleId ?? this.saleId,
        status: status ?? this.status,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusModel(
        id: json["id"] == null ? null : json["id"],
        saleStatusId:
            json["sale_status_id"] == null ? null : json["sale_status_id"],
        saleId: json["sale_id"] == null ? null : json["sale_id"],
        status: json["status"] == null ? null : json["status"],
        note: json["note"] == null ? null : json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "sale_status_id": saleStatusId == null ? null : saleStatusId,
        "sale_id": saleId == null ? null : saleId,
        "status": status == null ? null : status,
        "note": note == null ? null : note,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
