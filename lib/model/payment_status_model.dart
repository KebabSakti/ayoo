// To parse this JSON data, do
//
//     final paymentStatusModel = paymentStatusModelFromJson(jsonString);

import 'dart:convert';

List<PaymentStatusModel> paymentStatusModelFromJson(String str) =>
    List<PaymentStatusModel>.from(
        json.decode(str).map((x) => PaymentStatusModel.fromJson(x)));

String paymentStatusModelToJson(List<PaymentStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentStatusModel {
  PaymentStatusModel({
    this.id,
    this.paymentStatusId,
    this.saleId,
    this.status,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String paymentStatusId;
  String saleId;
  String status;
  dynamic note;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentStatusModel copyWith({
    int id,
    String paymentStatusId,
    String saleId,
    String status,
    dynamic note,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      PaymentStatusModel(
        id: id ?? this.id,
        paymentStatusId: paymentStatusId ?? this.paymentStatusId,
        saleId: saleId ?? this.saleId,
        status: status ?? this.status,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PaymentStatusModel.fromJson(Map<String, dynamic> json) =>
      PaymentStatusModel(
        id: json["id"] == null ? null : json["id"],
        paymentStatusId: json["payment_status_id"] == null
            ? null
            : json["payment_status_id"],
        saleId: json["sale_id"] == null ? null : json["sale_id"],
        status: json["status"] == null ? null : json["status"],
        note: json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "payment_status_id": paymentStatusId == null ? null : paymentStatusId,
        "sale_id": saleId == null ? null : saleId,
        "status": status == null ? null : status,
        "note": note,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
