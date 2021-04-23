// To parse this JSON data, do
//
//     final courierModel = courierModelFromJson(jsonString);

import 'dart:convert';

List<CourierModel> courierModelFromJson(String str) => List<CourierModel>.from(
    json.decode(str).map((x) => CourierModel.fromJson(x)));

String courierModelToJson(List<CourierModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourierModel {
  CourierModel({
    this.id,
    this.courierId,
    this.mitraId,
    this.instant,
    this.name,
    this.phone,
    this.fcmToken,
    this.active,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String courierId;
  String mitraId;
  int instant;
  String name;
  String phone;
  String fcmToken;
  int active;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  CourierModel copyWith({
    int id,
    String courierId,
    String mitraId,
    int instant,
    String name,
    String phone,
    String fcmToken,
    int active,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      CourierModel(
        id: id ?? this.id,
        courierId: courierId ?? this.courierId,
        mitraId: mitraId ?? this.mitraId,
        instant: instant ?? this.instant,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        fcmToken: fcmToken ?? this.fcmToken,
        active: active ?? this.active,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CourierModel.fromJson(Map<String, dynamic> json) => CourierModel(
        id: json["id"] == null ? null : json["id"],
        courierId: json["courier_id"] == null ? null : json["courier_id"],
        mitraId: json["mitra_id"] == null ? null : json["mitra_id"],
        instant: json["instant"] == null ? null : json["instant"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
        status: json["status"] == null ? null : json["status"],
        active: json["active"] == null ? null : json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "courier_id": courierId == null ? null : courierId,
        "mitra_id": mitraId == null ? null : mitraId,
        "instant": instant == null ? null : instant,
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "fcm_token": fcmToken == null ? null : fcmToken,
        "status": status == null ? null : status,
        "active": active == null ? null : active,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
