import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/model/product_paginate_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPaginateApi {
  final _dio = Get.find<DioInstance>();

  Future<ProductPaginateModel> fetchPaginateProduct(
      {@required ProductQueryModel query, int page}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('product?page=${page ?? 1}', data: {
        'sub_category_id': query.subCategoryId,
        'main_category_id': query.mainCategoryId,
        'keyword': query.keyword,
        'terlaris': query.terlaris,
        'diskon': query.diskon,
        'search': query.search,
        'view': query.view,
        'rating': query.rating,
        'pengiriman': query.pengiriman,
        'harga_min': query.hargaMin,
        'harga_max': query.hargaMax,
        'sorting': query.sorting,
        'seen': query.seen,
      });

      return productPaginateModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<List<ProductModel>> fetchProductDetail(
      {@required String productId}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('product/detail', data: {
        'product_id': productId,
      });

      return productModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<bool> addProductView({@required String productId}) async {
    try {
      await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('product/view', data: {'product_id': productId});

      return true;
    } on DioError catch (_) {
      return null;
    }
  }

  Future<List<ProductModel>> toggleFavourite(
      {@required String productId}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('product/favourite', data: {'product_id': productId});

      return productModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<bool> isFavourite({@required String productId}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('product/isfavourite', data: {'product_id': productId});

      return (int.parse(response.data) > 0);
    } on DioError catch (_) {
      return null;
    }
  }
}
