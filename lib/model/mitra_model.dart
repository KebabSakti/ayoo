// To parse this JSON data, do
//
//     final mitraModel = mitraModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/courier_model.dart';
import 'package:ayoo/model/delivery_type_model.dart';

List<MitraModel> mitraModelFromJson(String str) =>
    List<MitraModel>.from(json.decode(str).map((x) => MitraModel.fromJson(x)));

String mitraModelToJson(List<MitraModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MitraModel {
  MitraModel({
    this.id,
    this.mitraId,
    this.deliveryTypeId,
    this.instant,
    this.name,
    this.address,
    this.owner,
    this.phone,
    this.lat,
    this.lng,
    this.active,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.courierModel,
    this.deliveryTypeModel,
  });

  int id;
  String mitraId;
  String deliveryTypeId;
  int instant;
  String name;
  String address;
  String owner;
  String phone;
  String lat;
  String lng;
  int active;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<CourierModel> courierModel;
  DeliveryTypeModel deliveryTypeModel;

  MitraModel copyWith({
    int id,
    String mitraId,
    String deliveryTypeId,
    String instant,
    String name,
    String address,
    String owner,
    String phone,
    String lat,
    String lng,
    int active,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
    List<CourierModel> courierModel,
    DeliveryTypeModel deliveryTypeModel,
  }) =>
      MitraModel(
        id: id ?? this.id,
        mitraId: mitraId ?? this.mitraId,
        deliveryTypeId: deliveryTypeId ?? this.deliveryTypeId,
        instant: instant ?? this.instant,
        name: name ?? this.name,
        address: address ?? this.address,
        owner: owner ?? this.owner,
        phone: phone ?? this.phone,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        active: active ?? this.active,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        courierModel: courierModel ?? this.courierModel,
        deliveryTypeModel: deliveryTypeModel ?? this.deliveryTypeModel,
      );

  factory MitraModel.fromJson(Map<String, dynamic> json) => MitraModel(
        id: json["id"] == null ? null : json["id"],
        mitraId: json["mitra_id"] == null ? null : json["mitra_id"],
        deliveryTypeId:
            json["delivery_type_id"] == null ? null : json["delivery_type_id"],
        instant: json["instant"] == null ? null : json["instant"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        owner: json["owner"] == null ? null : json["owner"],
        phone: json["phone"] == null ? null : json["phone"],
        lat: json["lat"] == null ? null : json["lat"],
        lng: json["lng"] == null ? null : json["lng"],
        active: json["active"] == null ? null : json["active"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        courierModel: json["courier_model"] == null
            ? null
            : List<CourierModel>.from(
                json["courier_model"].map((x) => CourierModel.fromJson(x))),
        deliveryTypeModel: json["delivery_type_model"] == null
            ? null
            : DeliveryTypeModel.fromJson(json["delivery_type_model"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "mitra_id": mitraId == null ? null : mitraId,
        "delivery_type_id": deliveryTypeId == null ? null : deliveryTypeId,
        "instant": instant == null ? null : instant,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "owner": owner == null ? null : owner,
        "phone": phone == null ? null : phone,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "active": active == null ? null : active,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "courier_model": courierModel == null
            ? null
            : List<dynamic>.from(courierModel.map((x) => x.toJson())),
        "delivery_type_model":
            deliveryTypeModel == null ? null : deliveryTypeModel.toJson(),
      };
}
