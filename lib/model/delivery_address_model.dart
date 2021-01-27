// To parse this JSON data, do
//
//     final deliveryAddressModel = deliveryAddressModelFromJson(jsonString);

import 'dart:convert';

List<DeliveryAddressModel> deliveryAddressModelFromJson(String str) =>
    List<DeliveryAddressModel>.from(
        json.decode(str).map((x) => DeliveryAddressModel.fromJson(x)));

String deliveryAddressModelToJson(List<DeliveryAddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryAddressModel {
  DeliveryAddressModel({
    this.id,
    this.deliveryAddressId,
    this.userId,
    this.title,
    this.name,
    this.phone,
    this.address,
    this.note,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String deliveryAddressId;
  String userId;
  String title;
  String name;
  String phone;
  String address;
  String note;
  int isDefault;
  DateTime createdAt;
  DateTime updatedAt;

  DeliveryAddressModel copyWith({
    int id,
    String deliveryAddressId,
    String userId,
    String title,
    String name,
    String phone,
    String address,
    String note,
    int isDefault,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      DeliveryAddressModel(
        id: id ?? this.id,
        deliveryAddressId: deliveryAddressId ?? this.deliveryAddressId,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        note: note ?? this.note,
        isDefault: isDefault ?? this.isDefault,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) =>
      DeliveryAddressModel(
        id: json["id"] == null ? null : json["id"],
        deliveryAddressId: json["delivery_address_id"] == null
            ? null
            : json["delivery_address_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        title: json["title"] == null ? null : json["title"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        address: json["address"] == null ? null : json["address"],
        note: json["note"] == null ? null : json["note"],
        isDefault: json["is_default"] == null ? null : json["is_default"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "delivery_address_id":
            deliveryAddressId == null ? null : deliveryAddressId,
        "user_id": userId == null ? null : userId,
        "title": title == null ? null : title,
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "address": address == null ? null : address,
        "note": note == null ? null : note,
        "is_default": isDefault == null ? null : isDefault,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
