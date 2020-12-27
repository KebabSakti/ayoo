// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/delivery_type_model.dart';
import 'package:ayoo/model/product_sale_model.dart';
import 'package:ayoo/model/rating_weight_model.dart';
import 'package:ayoo/model/unit_model.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.productId,
    this.mainCategoryId,
    this.subCategoryId,
    this.deliveryTypeId,
    this.unitId,
    this.cover,
    this.name,
    this.caption,
    this.price,
    this.discount,
    this.lastPrice,
    this.tag,
    this.link,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.ratingWeightModel,
    this.deliveryTypeModel,
    this.unitModel,
    this.productSaleModel,
    this.favourite,
  });

  int id;
  String productId;
  String mainCategoryId;
  String subCategoryId;
  String deliveryTypeId;
  String unitId;
  String cover;
  String name;
  String caption;
  String price;
  String discount;
  String lastPrice;
  dynamic tag;
  dynamic link;
  int active;
  DateTime createdAt;
  DateTime updatedAt;
  RatingWeightModel ratingWeightModel;
  DeliveryTypeModel deliveryTypeModel;
  UnitModel unitModel;
  ProductSaleModel productSaleModel;
  dynamic favourite;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productId: json["product_id"],
        mainCategoryId: json["main_category_id"],
        subCategoryId: json["sub_category_id"],
        deliveryTypeId: json["delivery_type_id"],
        unitId: json["unit_id"],
        cover: json["cover"],
        name: json["name"],
        caption: json["caption"],
        price: json["price"],
        discount: json["discount"],
        lastPrice: json["last_price"],
        tag: json["tag"],
        link: json["link"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ratingWeightModel:
            RatingWeightModel.fromJson(json["rating_weight_model"]),
        deliveryTypeModel:
            DeliveryTypeModel.fromJson(json["delivery_type_model"]),
        unitModel: UnitModel.fromJson(json["unit_model"]),
        productSaleModel: ProductSaleModel.fromJson(json["product_sale_model"]),
        favourite: json["favourite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "main_category_id": mainCategoryId,
        "sub_category_id": subCategoryId,
        "delivery_type_id": deliveryTypeId,
        "unit_id": unitId,
        "cover": cover,
        "name": name,
        "caption": caption,
        "price": price,
        "discount": discount,
        "last_price": lastPrice,
        "tag": tag,
        "link": link,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rating_weight_model": ratingWeightModel.toJson(),
        "delivery_type_model": deliveryTypeModel.toJson(),
        "unit_model": unitModel.toJson(),
        "product_sale_model": productSaleModel.toJson(),
        "favourite": favourite,
      };
}
