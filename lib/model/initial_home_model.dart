// To parse this JSON data, do
//
//     final initialHomeModel = initialHomeModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/carousel_banner_model.dart';
import 'package:ayoo/model/main_category_model.dart';
import 'package:ayoo/model/most_search_model.dart';
import 'package:ayoo/model/product_paginate_model.dart';

InitialHomeModel initialHomeModelFromJson(String str) =>
    InitialHomeModel.fromJson(json.decode(str));

String initialHomeModelToJson(InitialHomeModel data) =>
    json.encode(data.toJson());

class InitialHomeModel {
  InitialHomeModel({
    this.carouselBannerModel,
    this.mainCategoryModel,
    this.productPopularPaginateModel,
    this.productPaginateModel,
    this.mostSearchModel,
  });

  List<CarouselBannerModel> carouselBannerModel;
  List<MainCategoryModel> mainCategoryModel;
  ProductPaginateModel productPopularPaginateModel;
  ProductPaginateModel productPaginateModel;
  List<MostSearchModel> mostSearchModel;

  factory InitialHomeModel.fromJson(Map<String, dynamic> json) =>
      InitialHomeModel(
        carouselBannerModel: List<CarouselBannerModel>.from(
            json["carousel_banner_model"]
                .map((x) => CarouselBannerModel.fromJson(x))),
        mainCategoryModel: List<MainCategoryModel>.from(
            json["main_category_model"]
                .map((x) => MainCategoryModel.fromJson(x))),
        productPopularPaginateModel:
            ProductPaginateModel.fromJson(json["product_popular"]),
        productPaginateModel:
            ProductPaginateModel.fromJson(json["product_paginate_model"]),
        mostSearchModel: List<MostSearchModel>.from(
            json["most_search_model"].map((x) => MostSearchModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "carousel_banner_model":
            List<dynamic>.from(carouselBannerModel.map((x) => x.toJson())),
        "main_category_model":
            List<dynamic>.from(mainCategoryModel.map((x) => x.toJson())),
        "product_popular": productPopularPaginateModel.toJson(),
        "product_paginate_model": productPaginateModel.toJson(),
        "most_search_model":
            List<dynamic>.from(mostSearchModel.map((x) => x.toJson())),
      };
}
