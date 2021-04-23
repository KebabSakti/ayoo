import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/courier_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourierApi {
  final DioInstance _dio = Get.find();

  Future<List<CourierModel>> fetch({@required String mitraId}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('courier/fetch', data: {'mitra_id': mitraId});

      return courierModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<bool> find(
      {@required String customerId, @required String courierToken}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('courier/find', data: {
        'customer_id': customerId,
        'courier_token': courierToken,
      });

      int result = int.parse(response.data);

      return (result > 0);
    } on DioError catch (_) {
      return null;
    }
  }
}
