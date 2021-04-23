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
    this.instant,
    this.saleId,
    this.distance,
    this.distanceText,
    this.duration,
    this.durationText,
    this.fee,
    this.originLat,
    this.originLng,
    this.destLat,
    this.destLng,
    this.createdAt,
    this.updatedAt,
    this.mitraModel,
  });

  int id;
  String deliveryMitraId;
  String mitraId;
  int instant;
  String saleId;
  int distance;
  String distanceText;
  int duration;
  String durationText;
  String fee;
  String originLat;
  String originLng;
  String destLat;
  String destLng;
  DateTime createdAt;
  DateTime updatedAt;
  MitraModel mitraModel;

  DeliveryMitraModel copyWith({
    int id,
    String deliveryMitraId,
    String mitraId,
    int instant,
    String saleId,
    int distance,
    String distanceText,
    int duration,
    String durationText,
    String fee,
    String originLat,
    String originLng,
    String destLat,
    String destLng,
    DateTime createdAt,
    DateTime updatedAt,
    MitraModel mitraModel,
  }) =>
      DeliveryMitraModel(
        id: id ?? this.id,
        deliveryMitraId: deliveryMitraId ?? this.deliveryMitraId,
        mitraId: mitraId ?? this.mitraId,
        instant: instant ?? this.instant,
        saleId: saleId ?? this.saleId,
        distance: distance ?? this.distance,
        distanceText: distanceText ?? this.distanceText,
        duration: duration ?? this.duration,
        durationText: durationText ?? this.durationText,
        fee: fee ?? this.fee,
        originLat: originLat ?? this.originLat,
        originLng: originLng ?? this.originLng,
        destLat: destLat ?? this.destLat,
        destLng: destLng ?? this.destLng,
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
        instant: json["instant"] == null ? null : json["instant"],
        saleId: json["sale_id"] == null ? null : json["sale_id"],
        distance: json["distance"] == null ? null : json["distance"],
        distanceText:
            json["distance_text"] == null ? null : json["distance_text"],
        duration: json["duration"] == null ? null : json["duration"],
        durationText:
            json["duration_text"] == null ? null : json["duration_text"],
        fee: json["fee"] == null ? null : json["fee"],
        originLat: json["origin_lat"] == null ? null : json["origin_lat"],
        originLng: json["origin_lng"] == null ? null : json["origin_lng"],
        destLat: json["dest_lat"] == null ? null : json["dest_lat"],
        destLng: json["dest_lng"] == null ? null : json["dest_lng"],
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
        "instant": instant == null ? null : instant,
        "sale_id": saleId == null ? null : saleId,
        "distance": distance == null ? null : distance,
        "distance_text": distanceText == null ? null : distanceText,
        "duration": duration == null ? null : duration,
        "duration_text": durationText == null ? null : durationText,
        "fee": fee == null ? null : fee,
        "origin_lat": originLat == null ? null : originLat,
        "origin_lng": originLng == null ? null : originLng,
        "dest_lat": destLat == null ? null : destLat,
        "dest_lng": destLng == null ? null : destLng,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "mitra_model": mitraModel == null ? null : mitraModel.toJson(),
      };
}
