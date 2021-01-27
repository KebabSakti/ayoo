// To parse this JSON data, do
//
//     final paymentStepModel = paymentStepModelFromJson(jsonString);

import 'dart:convert';

PaymentStepModel paymentStepModelFromJson(String str) =>
    PaymentStepModel.fromJson(json.decode(str));

String paymentStepModelToJson(PaymentStepModel data) =>
    json.encode(data.toJson());

class PaymentStepModel {
  PaymentStepModel({
    this.id,
    this.paymentStepId,
    this.paymentChannelId,
    this.pos,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String paymentStepId;
  int paymentChannelId;
  int pos;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentStepModel copyWith({
    int id,
    String paymentStepId,
    int paymentChannelId,
    int pos,
    String title,
    String description,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      PaymentStepModel(
        id: id ?? this.id,
        paymentStepId: paymentStepId ?? this.paymentStepId,
        paymentChannelId: paymentChannelId ?? this.paymentChannelId,
        pos: pos ?? this.pos,
        title: title ?? this.title,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PaymentStepModel.fromJson(Map<String, dynamic> json) =>
      PaymentStepModel(
        id: json["id"] == null ? null : json["id"],
        paymentStepId:
            json["payment_step_id"] == null ? null : json["payment_step_id"],
        paymentChannelId: json["payment_channel_id"] == null
            ? null
            : json["payment_channel_id"],
        pos: json["pos"] == null ? null : json["pos"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "payment_step_id": paymentStepId == null ? null : paymentStepId,
        "payment_channel_id":
            paymentChannelId == null ? null : paymentChannelId,
        "pos": pos == null ? null : pos,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
