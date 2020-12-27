// To parse this JSON data, do
//
//     final productPaginateModel = productPaginateModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/product_model.dart';

ProductPaginateModel productPaginateModelFromJson(String str) =>
    ProductPaginateModel.fromJson(json.decode(str));

String productPaginateModelToJson(ProductPaginateModel data) =>
    json.encode(data.toJson());

class ProductPaginateModel {
  ProductPaginateModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<ProductModel> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory ProductPaginateModel.fromJson(Map<String, dynamic> json) =>
      ProductPaginateModel(
        currentPage: json["current_page"],
        data: List<ProductModel>.from(
            json["data"].map((x) => ProductModel.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}
