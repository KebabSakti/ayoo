import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/carousel_banner_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselBannerApi {
  final _dio = Get.find<DioInstance>();

  Future<List<CarouselBannerModel>> fetchCarouselBanner({
    @required String target,
    String id,
  }) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post(
        'banner_slide',
        data: {
          'target': target,
          'id': id,
        },
      );

      return carouselBannerModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
