// To parse this JSON data, do
//
//     final paymentChannelModel = paymentChannelModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/payment_step_model.dart';

List<PaymentChannelModel> paymentChannelModelFromJson(String str) =>
    List<PaymentChannelModel>.from(
        json.decode(str).map((x) => PaymentChannelModel.fromJson(x)));

String paymentChannelModelToJson(List<PaymentChannelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentChannelModel {
  PaymentChannelModel({
    this.id,
    this.businessId,
    this.isLivemode,
    this.channelCode,
    this.name,
    this.currency,
    this.channelCategory,
    this.isEnabled,
    this.feeFix,
    this.feePercentage,
    this.image,
    this.active,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.paymentStepModel,
  });

  int id;
  String businessId;
  int isLivemode;
  String channelCode;
  String name;
  String currency;
  String channelCategory;
  int isEnabled;
  dynamic feeFix;
  dynamic feePercentage;
  String image;
  int active;
  int isDefault;
  DateTime createdAt;
  DateTime updatedAt;
  List<PaymentStepModel> paymentStepModel;

  PaymentChannelModel copyWith({
    int id,
    String businessId,
    int isLivemode,
    String channelCode,
    String name,
    String currency,
    String channelCategory,
    int isEnabled,
    dynamic feeFix,
    dynamic feePercentage,
    String image,
    int active,
    int isDefault,
    DateTime createdAt,
    DateTime updatedAt,
    List<PaymentStepModel> paymentStepModel,
  }) =>
      PaymentChannelModel(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        isLivemode: isLivemode ?? this.isLivemode,
        channelCode: channelCode ?? this.channelCode,
        name: name ?? this.name,
        currency: currency ?? this.currency,
        channelCategory: channelCategory ?? this.channelCategory,
        isEnabled: isEnabled ?? this.isEnabled,
        feeFix: feeFix ?? this.feeFix,
        feePercentage: feePercentage ?? this.feePercentage,
        image: image ?? this.image,
        active: active ?? this.active,
        isDefault: isDefault ?? this.isDefault,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        paymentStepModel: paymentStepModel ?? this.paymentStepModel,
      );

  factory PaymentChannelModel.fromJson(Map<String, dynamic> json) =>
      PaymentChannelModel(
        id: json["id"] == null ? null : json["id"],
        businessId: json["business_id"] == null ? null : json["business_id"],
        isLivemode: json["is_livemode"] == null ? null : json["is_livemode"],
        channelCode: json["channel_code"] == null ? null : json["channel_code"],
        name: json["name"] == null ? null : json["name"],
        currency: json["currency"] == null ? null : json["currency"],
        channelCategory:
            json["channel_category"] == null ? null : json["channel_category"],
        isEnabled: json["is_enabled"] == null ? null : json["is_enabled"],
        feeFix: json["fee_fix"],
        feePercentage: json["fee_percentage"],
        image: json["image"] == null ? null : json["image"],
        active: json["active"] == null ? null : json["active"],
        isDefault: json["is_default"] == null ? null : json["is_default"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        paymentStepModel: json["payment_step_model"] == null
            ? null
            : List<PaymentStepModel>.from(json["payment_step_model"]
                .map((x) => PaymentStepModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "business_id": businessId == null ? null : businessId,
        "is_livemode": isLivemode == null ? null : isLivemode,
        "channel_code": channelCode == null ? null : channelCode,
        "name": name == null ? null : name,
        "currency": currency == null ? null : currency,
        "channel_category": channelCategory == null ? null : channelCategory,
        "is_enabled": isEnabled == null ? null : isEnabled,
        "fee_fix": feeFix,
        "fee_percentage": feePercentage,
        "image": image == null ? null : image,
        "active": active == null ? null : active,
        "is_default": isDefault == null ? null : isDefault,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "payment_step_model": paymentStepModel == null
            ? null
            : List<dynamic>.from(paymentStepModel.map((x) => x.toJson())),
      };
}
