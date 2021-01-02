// To parse this JSON data, do
//
//     final productInfoModel = productInfoModelFromJson(jsonString);

import 'dart:convert';

ProductInfoModel productInfoModelFromJson(String str) =>
    ProductInfoModel.fromJson(json.decode(str));

String productInfoModelToJson(ProductInfoModel data) =>
    json.encode(data.toJson());

class ProductInfoModel {
  ProductInfoModel({
    this.id,
    this.productInfoId,
    this.productId,
    this.caption,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String productInfoId;
  String productId;
  String caption;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) =>
      ProductInfoModel(
        id: json["id"],
        productInfoId: json["product_info_id"],
        productId: json["product_id"],
        caption: json["caption"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_info_id": productInfoId,
        "product_id": productId,
        "caption": caption,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
