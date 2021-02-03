// To parse this JSON data, do
//
//     final initialHomeModel = initialHomeModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/carousel_banner_model.dart';
import 'package:ayoo/model/customer_model.dart';
import 'package:ayoo/model/main_category_model.dart';
import 'package:ayoo/model/payment_channel_model.dart';
import 'package:ayoo/model/product_paginate_model.dart';
import 'package:ayoo/model/search_model.dart';

InitialHomeModel initialHomeModelFromJson(String str) =>
    InitialHomeModel.fromJson(json.decode(str));

String initialHomeModelToJson(InitialHomeModel data) =>
    json.encode(data.toJson());

class InitialHomeModel {
  InitialHomeModel({
    this.customerModel,
    this.carouselBannerModel,
    this.mainCategoryModel,
    this.productPopularPaginateModel,
    this.productPaginateModel,
    this.mostSearchModel,
    this.paymentChannelModel,
  });

  CustomerModel customerModel;
  List<CarouselBannerModel> carouselBannerModel;
  List<MainCategoryModel> mainCategoryModel;
  ProductPaginateModel productPopularPaginateModel;
  ProductPaginateModel productPaginateModel;
  List<SearchModel> mostSearchModel;
  List<PaymentChannelModel> paymentChannelModel;

  InitialHomeModel copyWith({
    CustomerModel customerModel,
    List<CarouselBannerModel> carouselBannerModel,
    List<MainCategoryModel> mainCategoryModel,
    ProductPaginateModel productPopularPaginateModel,
    ProductPaginateModel productPaginateModel,
    List<SearchModel> mostSearchModel,
    List<PaymentChannelModel> paymentChannelModel,
  }) =>
      InitialHomeModel(
        customerModel: customerModel ?? this.customerModel,
        carouselBannerModel: carouselBannerModel ?? this.carouselBannerModel,
        mainCategoryModel: mainCategoryModel ?? this.mainCategoryModel,
        productPopularPaginateModel:
            productPopularPaginateModel ?? this.productPopularPaginateModel,
        productPaginateModel: productPaginateModel ?? this.productPaginateModel,
        mostSearchModel: mostSearchModel ?? this.mostSearchModel,
        paymentChannelModel: paymentChannelModel ?? this.paymentChannelModel,
      );

  factory InitialHomeModel.fromJson(Map<String, dynamic> json) =>
      InitialHomeModel(
        customerModel: json["customer_model"] == null
            ? null
            : CustomerModel.fromJson(json["customer_model"]),
        carouselBannerModel: json["carousel_banner_model"] == null
            ? null
            : List<CarouselBannerModel>.from(json["carousel_banner_model"]
                .map((x) => CarouselBannerModel.fromJson(x))),
        mainCategoryModel: json["main_category_model"] == null
            ? null
            : List<MainCategoryModel>.from(json["main_category_model"]
                .map((x) => MainCategoryModel.fromJson(x))),
        productPopularPaginateModel: json["product_popular"] == null
            ? null
            : ProductPaginateModel.fromJson(json["product_popular"]),
        productPaginateModel: json["product_paginate_model"] == null
            ? null
            : ProductPaginateModel.fromJson(json["product_paginate_model"]),
        mostSearchModel: json["most_search_model"] == null
            ? null
            : List<SearchModel>.from(
                json["most_search_model"].map((x) => SearchModel.fromJson(x))),
        paymentChannelModel: json["payment_channel_model"] == null
            ? null
            : List<PaymentChannelModel>.from(json["payment_channel_model"]
                .map((x) => PaymentChannelModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer_model": customerModel == null ? null : customerModel.toJson(),
        "carousel_banner_model": carouselBannerModel == null
            ? null
            : List<dynamic>.from(carouselBannerModel.map((x) => x.toJson())),
        "main_category_model": mainCategoryModel == null
            ? null
            : List<dynamic>.from(mainCategoryModel.map((x) => x.toJson())),
        "product_popular": productPopularPaginateModel == null
            ? null
            : productPopularPaginateModel.toJson(),
        "product_paginate_model":
            productPaginateModel == null ? null : productPaginateModel.toJson(),
        "most_search_model": mostSearchModel == null
            ? null
            : List<dynamic>.from(mostSearchModel.map((x) => x.toJson())),
        "payment_channel_model": paymentChannelModel == null
            ? null
            : List<PaymentChannelModel>.from(
                paymentChannelModel.map((x) => x.toJson())),
      };
}
