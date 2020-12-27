import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/product_paginate_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPaginateApi {
  final _dio = Get.find<DioInstance>();

  Future<ProductPaginateModel> fetchPaginateProduct(
      {@required ProductQueryModel query}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('product', data: {
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
      });

      return productPaginateModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
