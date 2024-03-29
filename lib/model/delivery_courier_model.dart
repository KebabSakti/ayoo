// To parse this JSON data, do
//
//     final deliveryCourierModel = deliveryCourierModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/courier_model.dart';

List<DeliveryCourierModel> deliveryCourierModelFromJson(String str) =>
    List<DeliveryCourierModel>.from(
        json.decode(str).map((x) => DeliveryCourierModel.fromJson(x)));

String deliveryCourierModelToJson(List<DeliveryCourierModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryCourierModel {
  DeliveryCourierModel({
    this.id,
    this.deliveryCourierId,
    this.deliveryMitraId,
    this.courierId,
    this.saleId,
    this.instant,
    this.deliveryNote,
    this.status,
    this.statusNote,
    this.createdAt,
    this.updatedAt,
    this.courierModel,
  });

  int id;
  String deliveryCourierId;
  String deliveryMitraId;
  String courierId;
  String saleId;
  int instant;
  String deliveryNote;
  String status;
  String statusNote;
  DateTime createdAt;
  DateTime updatedAt;
  CourierModel courierModel;

  DeliveryCourierModel copyWith({
    int id,
    String deliveryCourierId,
    String deliveryMitraId,
    String courierId,
    String saleId,
    int instant,
    String deliveryNote,
    String status,
    String statusNote,
    DateTime createdAt,
    DateTime updatedAt,
    CourierModel courierModel,
  }) =>
      DeliveryCourierModel(
        id: id ?? this.id,
        deliveryCourierId: deliveryCourierId ?? this.deliveryCourierId,
        deliveryMitraId: deliveryMitraId ?? this.deliveryMitraId,
        courierId: courierId ?? this.courierId,
        saleId: saleId ?? this.saleId,
        instant: instant ?? this.instant,
        deliveryNote: deliveryNote ?? this.deliveryNote,
        status: status ?? this.status,
        statusNote: statusNote ?? this.statusNote,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        courierModel: courierModel ?? this.courierModel,
      );

  factory DeliveryCourierModel.fromJson(Map<String, dynamic> json) =>
      DeliveryCourierModel(
        id: json["id"] == null ? null : json["id"],
        deliveryCourierId: json["delivery_courier_id"] == null
            ? null
            : json["delivery_courier_id"],
        deliveryMitraId: json["delivery_mitra_id"] == null
            ? null
            : json["delivery_mitra_id"],
        courierId: json["courier_id"] == null ? null : json["courier_id"],
        saleId: json["sale_id"] == null ? null : json["sale_id"],
        instant: json["instant"] == null ? null : json["instant"],
        deliveryNote:
            json["delivery_note"] == null ? null : json["delivery_note"],
        status: json["status"] == null ? null : json["status"],
        statusNote: json["status_note"] == null ? null : json["status_note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        courierModel: json["courier_model"] == null
            ? null
            : CourierModel.fromJson(json["courier_model"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "delivery_courier_id":
            deliveryCourierId == null ? null : deliveryCourierId,
        "delivery_mitra_id": deliveryMitraId == null ? null : deliveryMitraId,
        "courier_id": courierId == null ? null : courierId,
        "sale_id": saleId == null ? null : saleId,
        "instant": instant == null ? null : instant,
        "delivery_note": deliveryNote == null ? null : deliveryNote,
        "status": status == null ? null : status,
        "status_note": statusNote == null ? null : statusNote,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "courier_model": courierModel == null ? null : courierModel.toJson(),
      };
}
