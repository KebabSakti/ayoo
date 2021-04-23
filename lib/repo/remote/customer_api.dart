import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/customer_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomerApi {
  final DioInstance _dio = Get.find();

  Future<CustomerModel> status({@required String status}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('customer/status', data: {'status': status});

      return customerModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
