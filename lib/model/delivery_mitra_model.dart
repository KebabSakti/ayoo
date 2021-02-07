// To parse this JSON data, do
//
//     final deliveryMitraModel = deliveryMitraModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/mitra_model.dart';

List<DeliveryMitraModel> deliveryMitraModelFromJson(String str) =>
    List<DeliveryMitraModel>.from(
        json.decode(str).map((x) => DeliveryMitraModel.fromJson(x)));

String deliveryMitraModelToJson(List<DeliveryMitraModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryMitraModel {
  DeliveryMitraModel({
    this.id,
    this.deliveryMitraId,
    this.mitraId,
    this.saleId,
    this.distance,
    this.distanceText,
    this.duration,
    this.durationText,
    this.fee,
    this.createdAt,
    this.updatedAt,
    this.mitraModel,
  });

  int id;
  String deliveryMitraId;
  String mitraId;
  String saleId;
  int distance;
  String distanceText;
  int duration;
  String durationText;
  String fee;
  DateTime createdAt;
  DateTime updatedAt;
  MitraModel mitraModel;

  DeliveryMitraModel copyWith({
    int id,
    String deliveryMitraId,
    String mitraId,
    String saleId,
    int distance,
    String distanceText,
    int duration,
    String durationText,
    String fee,
    DateTime createdAt,
    DateTime updatedAt,
    MitraModel mitraModel,
  }) =>
      DeliveryMitraModel(
        id: id ?? this.id,
        deliveryMitraId: deliveryMitraId ?? this.deliveryMitraId,
        mitraId: mitraId ?? this.mitraId,
        saleId: saleId ?? this.saleId,
        distance: distance ?? this.distance,
        distanceText: distanceText ?? this.distanceText,
        duration: duration ?? this.duration,
        durationText: durationText ?? this.durationText,
        fee: fee ?? this.fee,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        mitraModel: mitraModel ?? this.mitraModel,
      );

  factory DeliveryMitraModel.fromJson(Map<String, dynamic> json) =>
      DeliveryMitraModel(
        id: json["id"] == null ? null : json["id"],
        deliveryMitraId: json["delivery_mitra_id"] == null
            ? null
            : json["delivery_mitra_id"],
        mitraId: json["mitra_id"] == null ? null : json["mitra_id"],
        saleId: json["sale_id"] == null ? null : json["sale_id"],
        distance: json["distance"] == null ? null : json["distance"],
        distanceText:
            json["distance_text"] == null ? null : json["distance_text"],
        duration: json["duration"] == null ? null : json["duration"],
        durationText:
            json["duration_text"] == null ? null : json["duration_text"],
        fee: json["fee"] == null ? null : json["fee"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        mitraModel: json["mitra_model"] == null
            ? null
            : MitraModel.fromJson(json["mitra_model"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "delivery_mitra_id": deliveryMitraId == null ? null : deliveryMitraId,
        "mitra_id": mitraId == null ? null : mitraId,
        "sale_id": saleId == null ? null : saleId,
        "distance": distance == null ? null : distance,
        "distance_text": distanceText == null ? null : distanceText,
        "duration": duration == null ? null : duration,
        "duration_text": durationText == null ? null : durationText,
        "fee": fee == null ? null : fee,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "mitra_model": mitraModel == null ? null : mitraModel.toJson(),
      };
}
