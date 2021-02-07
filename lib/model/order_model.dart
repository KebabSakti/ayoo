// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/customer_model.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/model/delivery_courier_model.dart';
import 'package:ayoo/model/delivery_mitra_model.dart';
import 'package:ayoo/model/order_detail_model.dart';
import 'package:ayoo/model/order_status_model.dart';
import 'package:ayoo/model/payment_channel_model.dart';
import 'package:ayoo/model/payment_status_model.dart';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  OrderModel({
    this.id,
    this.saleId,
    this.customerId,
    this.paymentChannelId,
    this.shopTotal,
    this.deliveryTotal,
    this.adminFeeTotal,
    this.code,
    this.subTotal,
    this.voucher,
    this.voucherAmount,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.orderStatusModel,
    this.orderDetailModel,
    this.paymentChannelModel,
    this.paymentStatusModel,
    this.customerModel,
    this.mapAddress,
    this.deliveryAddressModel,
    this.deliveryMitraModel,
    this.deliveryCourierModel,
  });

  int id;
  String saleId;
  String customerId;
  String paymentChannelId;
  String shopTotal;
  String deliveryTotal;
  String adminFeeTotal;
  String code;
  String subTotal;
  String voucher;
  String voucherAmount;
  String total;
  DateTime createdAt;
  DateTime updatedAt;
  List<OrderStatusModel> orderStatusModel;
  List<OrderDetailModel> orderDetailModel;
  PaymentChannelModel paymentChannelModel;
  List<PaymentStatusModel> paymentStatusModel;
  CustomerModel customerModel;
  String mapAddress;
  DeliveryAddressModel deliveryAddressModel;
  List<DeliveryMitraModel> deliveryMitraModel;
  List<DeliveryCourierModel> deliveryCourierModel;

  OrderModel copyWith({
    int id,
    String saleId,
    String customerId,
    String paymentChannelId,
    String shopTotal,
    String deliveryTotal,
    String adminFeeTotal,
    String code,
    String subTotal,
    String voucher,
    String voucherAmount,
    String total,
    DateTime createdAt,
    DateTime updatedAt,
    List<OrderStatusModel> orderStatusModel,
    List<OrderDetailModel> orderDetailModel,
    PaymentChannelModel paymentChannelModel,
    List<PaymentStatusModel> paymentStatusModel,
    CustomerModel customerModel,
    String mapAddress,
    DeliveryAddressModel deliveryAddressModel,
    List<DeliveryMitraModel> deliveryMitraModel,
    List<DeliveryCourierModel> deliveryCourierModel,
  }) =>
      OrderModel(
        id: id ?? this.id,
        saleId: saleId ?? this.saleId,
        customerId: customerId ?? this.customerId,
        paymentChannelId: paymentChannelId ?? this.paymentChannelId,
        shopTotal: shopTotal ?? this.shopTotal,
        deliveryTotal: deliveryTotal ?? this.deliveryTotal,
        adminFeeTotal: adminFeeTotal ?? this.adminFeeTotal,
        code: code ?? this.code,
        subTotal: subTotal ?? this.subTotal,
        voucher: voucher ?? this.voucher,
        voucherAmount: voucherAmount ?? this.voucherAmount,
        total: total ?? this.total,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        orderStatusModel: orderStatusModel ?? this.orderStatusModel,
        orderDetailModel: orderDetailModel ?? this.orderDetailModel,
        paymentChannelModel: paymentChannelModel ?? this.paymentChannelModel,
        paymentStatusModel: paymentStatusModel ?? this.paymentStatusModel,
        customerModel: customerModel ?? this.customerModel,
        mapAddress: mapAddress ?? this.mapAddress,
        deliveryAddressModel: deliveryAddressModel ?? this.deliveryAddressModel,
        deliveryMitraModel: deliveryMitraModel ?? this.deliveryMitraModel,
        deliveryCourierModel: deliveryCourierModel ?? this.deliveryCourierModel,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"] == null ? null : json["id"],
        saleId: json["sale_id"] == null ? null : json["sale_id"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        paymentChannelId: json["payment_channel_id"] == null
            ? null
            : json["payment_channel_id"],
        shopTotal: json["shop_total"] == null ? null : json["shop_total"],
        deliveryTotal:
            json["delivery_total"] == null ? null : json["delivery_total"],
        adminFeeTotal:
            json["admin_fee_total"] == null ? null : json["admin_fee_total"],
        code: json["code"] == null ? null : json["code"],
        subTotal: json["sub_total"] == null ? null : json["sub_total"],
        voucher: json["voucher"] == null ? null : json["voucher"],
        voucherAmount:
            json["voucher_amount"] == null ? null : json["voucher_amount"],
        total: json["total"] == null ? null : json["total"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        orderStatusModel: json["order_status_model"] == null
            ? null
            : List<OrderStatusModel>.from(json["order_status_model"]
                .map((x) => OrderStatusModel.fromJson(x))),
        orderDetailModel: json["order_detail_model"] == null
            ? null
            : List<OrderDetailModel>.from(json["order_detail_model"]
                .map((x) => OrderDetailModel.fromJson(x))),
        paymentChannelModel: json["payment_channel_model"] == null
            ? null
            : PaymentChannelModel.fromJson(json["payment_channel_model"]),
        paymentStatusModel: json["payment_status_model"] == null
            ? null
            : List<PaymentStatusModel>.from(json["payment_status_model"]
                .map((x) => PaymentStatusModel.fromJson(x))),
        customerModel: json["customer_model"] == null
            ? null
            : CustomerModel.fromJson(json["customer_model"]),
        mapAddress: json["map_address"] == null ? null : json["map_address"],
        deliveryAddressModel: json["delivery_address_model"] == null
            ? null
            : DeliveryAddressModel.fromJson(json["delivery_address_model"]),
        deliveryMitraModel: json["delivery_mitra_model"] == null
            ? null
            : List<DeliveryMitraModel>.from(json["delivery_mitra_model"]
                .map((x) => DeliveryMitraModel.fromJson(x))),
        deliveryCourierModel: json["delivery_courier_model"] == null
            ? null
            : List<DeliveryCourierModel>.from(json["delivery_courier_model"]
                .map((x) => DeliveryCourierModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "sale_id": saleId == null ? null : saleId,
        "customer_id": customerId == null ? null : customerId,
        "payment_channel_id":
            paymentChannelId == null ? null : paymentChannelId,
        "shop_total": shopTotal == null ? null : shopTotal,
        "delivery_total": deliveryTotal == null ? null : deliveryTotal,
        "admin_fee_total": adminFeeTotal == null ? null : adminFeeTotal,
        "code": code == null ? null : code,
        "sub_total": subTotal == null ? null : subTotal,
        "voucher": voucher == null ? null : voucher,
        "voucher_amount": voucherAmount == null ? null : voucherAmount,
        "total": total == null ? null : total,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "order_status_model": orderStatusModel == null
            ? null
            : List<dynamic>.from(orderStatusModel.map((x) => x.toJson())),
        "order_detail_model": orderDetailModel == null
            ? null
            : List<dynamic>.from(orderDetailModel.map((x) => x.toJson())),
        "payment_channel_model":
            paymentChannelModel == null ? null : paymentChannelModel.toJson(),
        "payment_status_model": paymentStatusModel == null
            ? null
            : List<dynamic>.from(paymentStatusModel.map((x) => x.toJson())),
        "customer_model": customerModel == null ? null : customerModel.toJson(),
        "map_address": mapAddress == null ? null : mapAddress,
        "delivery_address_model":
            deliveryAddressModel == null ? null : deliveryAddressModel.toJson(),
        "delivery_mitra_model": deliveryMitraModel == null
            ? null
            : List<dynamic>.from(deliveryMitraModel.map((x) => x.toJson())),
        "delivery_courier_model": deliveryCourierModel == null
            ? null
            : List<dynamic>.from(deliveryCourierModel.map((x) => x.toJson())),
      };
}
