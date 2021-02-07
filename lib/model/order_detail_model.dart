// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/product_model.dart';

List<OrderDetailModel> orderDetailModelFromJson(String str) =>
    List<OrderDetailModel>.from(
        json.decode(str).map((x) => OrderDetailModel.fromJson(x)));

String orderDetailModelToJson(List<OrderDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDetailModel {
  OrderDetailModel({
    this.id,
    this.saleDetailId,
    this.saleId,
    this.productId,
    this.note,
    this.qty,
    this.total,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String saleDetailId;
  String saleId;
  String productId;
  String note;
  int qty;
  String total;
  ProductModel product;
  DateTime createdAt;
  DateTime updatedAt;

  OrderDetailModel copyWith({
    int id,
    String saleDetailId,
    String saleId,
    String deliveryTypeId,
    String productId,
    String note,
    int qty,
    String total,
    ProductModel product,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      OrderDetailModel(
        id: id ?? this.id,
        saleDetailId: saleDetailId ?? this.saleDetailId,
        saleId: saleId ?? this.saleId,
        productId: productId ?? this.productId,
        note: note ?? this.note,
        qty: qty ?? this.qty,
        total: total ?? this.total,
        product: product ?? this.product,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
        id: json["id"] == null ? null : json["id"],
        saleDetailId:
            json["sale_detail_id"] == null ? null : json["sale_detail_id"],
        saleId: json["sale_id"] == null ? null : json["sale_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        note: json["note"] == null ? null : json["note"],
        qty: json["qty"] == null ? null : json["qty"],
        total: json["total"] == null ? null : json["total"],
        product: json["product"] == null
            ? null
            : ProductModel.fromJson(json["product"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "sale_detail_id": saleDetailId == null ? null : saleDetailId,
        "sale_id": saleId == null ? null : saleId,
        "product_id": productId == null ? null : productId,
        "note": note == null ? null : note,
        "qty": qty == null ? null : qty,
        "total": total == null ? null : total,
        "product": product == null ? null : product.toJson(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
