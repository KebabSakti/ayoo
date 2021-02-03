import 'dart:convert';

import 'package:ayoo/model/courier_model.dart';
import 'package:ayoo/model/customer_model.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/model/delivery_type_model.dart';
import 'package:ayoo/model/mitra_model.dart';

List<DeliveryDetailModel> deliveryDetailModelFromJson(String str) =>
    List<DeliveryDetailModel>.from(
        json.decode(str).map((x) => DeliveryDetailModel.fromJson(x)));

String deliveryDetailModelToJson(List<DeliveryDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryDetailModel {
  DeliveryDetailModel({
    this.id,
    this.deliveryDetailId,
    this.deliveryTypeId,
    this.saleId,
    this.userId,
    this.deliveryAddressId,
    this.mitraId,
    this.courierId,
    this.description,
    this.distance,
    this.eta,
    this.fee,
    this.status,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.deliveryTypeModel,
    this.customerModel,
    this.deliveryAddressModel,
    this.mitraModel,
    this.courierModel,
  });

  int id;
  String deliveryDetailId;
  String deliveryTypeId;
  String saleId;
  String userId;
  String deliveryAddressId;
  String mitraId;
  String courierId;
  String description;
  String distance;
  int eta;
  String fee;
  String status;
  dynamic note;
  DateTime createdAt;
  DateTime updatedAt;
  List<DeliveryTypeModel> deliveryTypeModel;
  CustomerModel customerModel;
  DeliveryAddressModel deliveryAddressModel;
  List<MitraModel> mitraModel;
  List<CourierModel> courierModel;

  DeliveryDetailModel copyWith({
    int id,
    String deliveryDetailId,
    String deliveryTypeId,
    String saleId,
    String userId,
    String deliveryAddressId,
    String mitraId,
    String courierId,
    String description,
    String distance,
    int eta,
    String fee,
    String status,
    dynamic note,
    DateTime createdAt,
    DateTime updatedAt,
    List<DeliveryTypeModel> deliveryTypeModel,
    CustomerModel customerModel,
    DeliveryAddressModel deliveryAddressModel,
    List<MitraModel> mitraModel,
    List<CourierModel> courierModel,
  }) =>
      DeliveryDetailModel(
        id: id ?? this.id,
        deliveryDetailId: deliveryDetailId ?? this.deliveryDetailId,
        deliveryTypeId: deliveryTypeId ?? this.deliveryTypeId,
        saleId: saleId ?? this.saleId,
        userId: userId ?? this.userId,
        deliveryAddressId: deliveryAddressId ?? this.deliveryAddressId,
        mitraId: mitraId ?? this.mitraId,
        courierId: courierId ?? this.courierId,
        description: description ?? this.description,
        distance: distance ?? this.distance,
        eta: eta ?? this.eta,
        fee: fee ?? this.fee,
        status: status ?? this.status,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deliveryTypeModel: deliveryTypeModel ?? this.deliveryTypeModel,
        customerModel: customerModel ?? this.customerModel,
        deliveryAddressModel: deliveryAddressModel ?? this.deliveryAddressModel,
        mitraModel: mitraModel ?? this.mitraModel,
        courierModel: courierModel ?? this.courierModel,
      );

  factory DeliveryDetailModel.fromJson(Map<String, dynamic> json) =>
      DeliveryDetailModel(
        id: json["id"] == null ? null : json["id"],
        deliveryDetailId: json["delivery_detail_id"] == null
            ? null
            : json["delivery_detail_id"],
        deliveryTypeId:
            json["delivery_type_id"] == null ? null : json["delivery_type_id"],
        saleId: json["sale_id"] == null ? null : json["sale_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        deliveryAddressId: json["delivery_address_id"] == null
            ? null
            : json["delivery_address_id"],
        mitraId: json["mitra_id"] == null ? null : json["mitra_id"],
        courierId: json["courier_id"] == null ? null : json["courier_id"],
        description: json["description"] == null ? null : json["description"],
        distance: json["distance"] == null ? null : json["distance"],
        eta: json["eta"] == null ? null : json["eta"],
        fee: json["fee"] == null ? null : json["fee"],
        status: json["status"] == null ? null : json["status"],
        note: json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deliveryTypeModel: json["delivery_type_model"] == null
            ? null
            : List<DeliveryTypeModel>.from(json["delivery_type_model"]
                .map((x) => DeliveryTypeModel.fromJson(x))),
        customerModel: json["customer_model"] == null
            ? null
            : CustomerModel.fromJson(json["customer_model"]),
        deliveryAddressModel: json["delivery_address_model"] == null
            ? null
            : DeliveryAddressModel.fromJson(json["delivery_address_model"]),
        mitraModel: json["mitra_model"] == null
            ? null
            : List<MitraModel>.from(
                json["mitra_model"].map((x) => MitraModel.fromJson(x))),
        courierModel: json["courier_model"] == null
            ? null
            : List<CourierModel>.from(
                json["courier_model"].map((x) => CourierModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "delivery_detail_id":
            deliveryDetailId == null ? null : deliveryDetailId,
        "delivery_type_id": deliveryTypeId == null ? null : deliveryTypeId,
        "sale_id": saleId == null ? null : saleId,
        "user_id": userId == null ? null : userId,
        "delivery_address_id":
            deliveryAddressId == null ? null : deliveryAddressId,
        "mitra_id": mitraId == null ? null : mitraId,
        "courier_id": courierId == null ? null : courierId,
        "description": description == null ? null : description,
        "distance": distance == null ? null : distance,
        "eta": eta == null ? null : eta,
        "fee": fee == null ? null : fee,
        "status": status == null ? null : status,
        "note": note,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "delivery_type_model": deliveryTypeModel == null
            ? null
            : List<dynamic>.from(deliveryTypeModel.map((x) => x.toJson())),
        "customer_model": customerModel == null ? null : customerModel.toJson(),
        "delivery_address_model":
            deliveryAddressModel == null ? null : deliveryAddressModel.toJson(),
        "mitra_model": mitraModel == null
            ? null
            : List<dynamic>.from(mitraModel.map((x) => x.toJson())),
        "courier_model": courierModel == null
            ? null
            : List<dynamic>.from(courierModel.map((x) => x.toJson())),
      };
}
