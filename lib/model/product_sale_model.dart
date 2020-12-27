// To parse this JSON data, do
//
//     final productSaleModel = productSaleModelFromJson(jsonString);

import 'dart:convert';

ProductSaleModel productSaleModelFromJson(String str) =>
    ProductSaleModel.fromJson(json.decode(str));

String productSaleModelToJson(ProductSaleModel data) =>
    json.encode(data.toJson());

class ProductSaleModel {
  ProductSaleModel({
    this.id,
    this.productSaleId,
    this.productId,
    this.qtyTotal,
    this.amountTotal,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String productSaleId;
  String productId;
  int qtyTotal;
  String amountTotal;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductSaleModel.fromJson(Map<String, dynamic> json) =>
      ProductSaleModel(
        id: json["id"],
        productSaleId: json["product_sale_id"],
        productId: json["product_id"],
        qtyTotal: json["qty_total"],
        amountTotal: json["amount_total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_sale_id": productSaleId,
        "product_id": productId,
        "qty_total": qtyTotal,
        "amount_total": amountTotal,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
