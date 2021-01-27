// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/delivery_address_model.dart';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    this.id,
    this.userId,
    this.name,
    this.phone,
    this.active,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.deliveryAddressModel,
  });

  int id;
  String userId;
  dynamic name;
  dynamic phone;
  int active;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  List<DeliveryAddressModel> deliveryAddressModel;

  CustomerModel copyWith({
    int id,
    String userId,
    dynamic name,
    dynamic phone,
    int active,
    String type,
    DateTime createdAt,
    DateTime updatedAt,
    List<DeliveryAddressModel> deliveryAddressModel,
  }) =>
      CustomerModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        active: active ?? this.active,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deliveryAddressModel: deliveryAddressModel ?? this.deliveryAddressModel,
      );

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        name: json["name"],
        phone: json["phone"],
        active: json["active"] == null ? null : json["active"],
        type: json["type"] == null ? null : json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deliveryAddressModel: json["delivery_address_model"] == null
            ? null
            : List<DeliveryAddressModel>.from(json["delivery_address_model"]
                .map((x) => DeliveryAddressModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "name": name,
        "phone": phone,
        "active": active == null ? null : active,
        "type": type == null ? null : type,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "delivery_address_model": deliveryAddressModel == null
            ? null
            : List<dynamic>.from(deliveryAddressModel.map((x) => x.toJson())),
      };
}
