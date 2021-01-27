import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailApi {
  final _dio = Get.find<DioInstance>();

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
}
