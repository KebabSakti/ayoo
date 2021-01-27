// To parse this JSON data, do
//
//     final mitraModel = mitraModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/delivery_type_model.dart';

MitraModel mitraModelFromJson(String str) =>
    MitraModel.fromJson(json.decode(str));

String mitraModelToJson(MitraModel data) => json.encode(data.toJson());

class MitraModel {
  MitraModel({
    this.id,
    this.mitraId,
    this.deliveryTypeId,
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
    this.distance,
    this.deliveryType,
    this.ongkir,
  });

  int id;
  String mitraId;
  String deliveryTypeId;
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
  double distance;
  DeliveryTypeModel deliveryType;
  String ongkir;

  MitraModel copyWith({
    int id,
    String mitraId,
    String deliveryTypeId,
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
    double distance,
    DeliveryTypeModel deliveryType,
    String ongkir,
  }) =>
      MitraModel(
        id: id ?? this.id,
        mitraId: mitraId ?? this.mitraId,
        deliveryTypeId: deliveryTypeId ?? this.deliveryTypeId,
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
        distance: distance ?? this.distance,
        deliveryType: deliveryType ?? this.deliveryType,
        ongkir: ongkir ?? this.ongkir,
      );

  factory MitraModel.fromJson(Map<String, dynamic> json) => MitraModel(
        id: json["id"] == null ? null : json["id"],
        mitraId: json["mitra_id"] == null ? null : json["mitra_id"],
        deliveryTypeId:
            json["delivery_type_id"] == null ? null : json["delivery_type_id"],
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
        distance: json["distance"] == null ? null : json["distance"].toDouble(),
        deliveryType: json["delivery_type_model"] == null
            ? null
            : DeliveryTypeModel.fromJson(json["delivery_type_model"]),
        ongkir: json["ongkir"] == null ? null : json["ongkir"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "mitra_id": mitraId == null ? null : mitraId,
        "delivery_type_id": deliveryTypeId == null ? null : deliveryTypeId,
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
        "distance": distance == null ? null : distance,
        "delivery_type_model":
            deliveryType == null ? null : deliveryType.toJson(),
        "ongkir": ongkir == null ? null : ongkir,
      };
}
