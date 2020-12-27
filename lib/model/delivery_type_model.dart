// To parse this JSON data, do
//
//     final deliveryTypeModel = deliveryTypeModelFromJson(jsonString);

import 'dart:convert';

DeliveryTypeModel deliveryTypeModelFromJson(String str) =>
    DeliveryTypeModel.fromJson(json.decode(str));

String deliveryTypeModelToJson(DeliveryTypeModel data) =>
    json.encode(data.toJson());

class DeliveryTypeModel {
  DeliveryTypeModel({
    this.id,
    this.deliveryTypeId,
    this.instant,
    this.day,
    this.orderStart,
    this.orderEnd,
    this.deliveryStart,
    this.deliveryEnd,
    this.caption,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String deliveryTypeId;
  int instant;
  dynamic day;
  dynamic orderStart;
  dynamic orderEnd;
  dynamic deliveryStart;
  dynamic deliveryEnd;
  dynamic caption;
  DateTime createdAt;
  DateTime updatedAt;

  factory DeliveryTypeModel.fromJson(Map<String, dynamic> json) =>
      DeliveryTypeModel(
        id: json["id"],
        deliveryTypeId: json["delivery_type_id"],
        instant: json["instant"],
        day: json["day"],
        orderStart: json["order_start"],
        orderEnd: json["order_end"],
        deliveryStart: json["delivery_start"],
        deliveryEnd: json["delivery_end"],
        caption: json["caption"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "delivery_type_id": deliveryTypeId,
        "instant": instant,
        "day": day,
        "order_start": orderStart,
        "order_end": orderEnd,
        "delivery_start": deliveryStart,
        "delivery_end": deliveryEnd,
        "caption": caption,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
