// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/delivery_type_model.dart';
import 'package:ayoo/model/product_info_model.dart';
import 'package:ayoo/model/product_sale_model.dart';
import 'package:ayoo/model/rating_model.dart';
import 'package:ayoo/model/rating_weight_model.dart';
import 'package:ayoo/model/unit_model.dart';
import 'package:ayoo/model/view_model.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
    this.productInfoModel,
    this.ratingModel,
    this.ratingWeightModel,
    this.deliveryTypeModel,
    this.unitModel,
    this.productSaleModel,
    this.viewModel,
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
  List<ProductInfoModel> productInfoModel;
  List<RatingModel> ratingModel;
  RatingWeightModel ratingWeightModel;
  DeliveryTypeModel deliveryTypeModel;
  UnitModel unitModel;
  ProductSaleModel productSaleModel;
  ViewModel viewModel;
  dynamic favourite;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        mainCategoryId:
            json["main_category_id"] == null ? null : json["main_category_id"],
        subCategoryId:
            json["sub_category_id"] == null ? null : json["sub_category_id"],
        deliveryTypeId:
            json["delivery_type_id"] == null ? null : json["delivery_type_id"],
        unitId: json["unit_id"] == null ? null : json["unit_id"],
        cover: json["cover"] == null ? null : json["cover"],
        name: json["name"] == null ? null : json["name"],
        caption: json["caption"] == null ? null : json["caption"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        lastPrice: json["last_price"] == null ? null : json["last_price"],
        tag: json["tag"],
        link: json["link"],
        active: json["active"] == null ? null : json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        productInfoModel: json["product_info_model"] == null
            ? null
            : List<ProductInfoModel>.from(json["product_info_model"]
                .map((x) => ProductInfoModel.fromJson(x))),
        ratingModel: json["rating_model"] == null
            ? null
            : List<RatingModel>.from(
                json["rating_model"].map((x) => RatingModel.fromJson(x))),
        ratingWeightModel: json["rating_weight_model"] == null
            ? null
            : RatingWeightModel.fromJson(json["rating_weight_model"]),
        deliveryTypeModel: json["delivery_type_model"] == null
            ? null
            : DeliveryTypeModel.fromJson(json["delivery_type_model"]),
        unitModel: json["unit_model"] == null
            ? null
            : UnitModel.fromJson(json["unit_model"]),
        productSaleModel: json["product_sale_model"] == null
            ? null
            : ProductSaleModel.fromJson(json["product_sale_model"]),
        viewModel: json["view_model"] == null
            ? null
            : ViewModel.fromJson(json["view_model"]),
        favourite: json["favourite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_id": productId == null ? null : productId,
        "main_category_id": mainCategoryId == null ? null : mainCategoryId,
        "sub_category_id": subCategoryId == null ? null : subCategoryId,
        "delivery_type_id": deliveryTypeId == null ? null : deliveryTypeId,
        "unit_id": unitId == null ? null : unitId,
        "cover": cover == null ? null : cover,
        "name": name == null ? null : name,
        "caption": caption == null ? null : caption,
        "price": price == null ? null : price,
        "discount": discount == null ? null : discount,
        "last_price": lastPrice == null ? null : lastPrice,
        "tag": tag,
        "link": link,
        "active": active == null ? null : active,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "product_info_model": productInfoModel == null
            ? null
            : List<dynamic>.from(productInfoModel.map((x) => x.toJson())),
        "rating_model": ratingModel == null
            ? null
            : List<dynamic>.from(ratingModel.map((x) => x.toJson())),
        "rating_weight_model":
            ratingWeightModel == null ? null : ratingWeightModel.toJson(),
        "delivery_type_model":
            deliveryTypeModel == null ? null : deliveryTypeModel.toJson(),
        "unit_model": unitModel == null ? null : unitModel.toJson(),
        "product_sale_model":
            productSaleModel == null ? null : productSaleModel.toJson(),
        "view_model": viewModel == null ? null : viewModel.toJson(),
        "favourite": favourite,
      };
}
