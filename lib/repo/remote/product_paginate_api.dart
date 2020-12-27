import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/product_paginate_model.dart';
import 'package:get/get.dart';

class ProductPaginateApi {
  final _dio = Get.find<DioInstance>();

  Future<ProductPaginateModel> fetchPaginateProduct() async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .get('initial_home');

      return productPaginateModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
