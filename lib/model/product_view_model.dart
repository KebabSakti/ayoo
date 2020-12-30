// To parse this JSON data, do
//
//     final productViewModel = productViewModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/product_model.dart';

List<ProductViewModel> productViewModelFromJson(String str) =>
    List<ProductViewModel>.from(
        json.decode(str).map((x) => ProductViewModel.fromJson(x)));

String productViewModelToJson(List<ProductViewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductViewModel {
  ProductViewModel({
    this.id,
    this.viewerId,
    this.relationId,
    this.userId,
    this.view,
    this.createdAt,
    this.updatedAt,
    this.productModel,
  });

  int id;
  String viewerId;
  String relationId;
  String userId;
  int view;
  DateTime createdAt;
  DateTime updatedAt;
  ProductModel productModel;

  factory ProductViewModel.fromJson(Map<String, dynamic> json) =>
      ProductViewModel(
        id: json["id"],
        viewerId: json["viewer_id"],
        relationId: json["relation_id"],
        userId: json["user_id"],
        view: json["view"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productModel: ProductModel.fromJson(json["product_model"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "viewer_id": viewerId,
        "relation_id": relationId,
        "user_id": userId,
        "view": view,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product_model": productModel.toJson(),
      };
}
