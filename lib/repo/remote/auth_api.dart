import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/auth_model.dart';
import 'package:ayoo/model/customer_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthApi {
  final DioInstance _dio = Get.find();

  Future<AuthModel> requestGuestAccess() async {
    try {
      var response = await _dio.dio.get('auth/customer/guest_access');

      return authModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<CustomerModel> login({
    @required String phone,
    @required String password,
  }) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('auth/customer/login', data: {
        "phone": phone,
        "password": password,
      });

      return customerModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<CustomerModel> register({
    @required String name,
    @required String phone,
    @required String password,
  }) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post(
        'auth/customer/register',
        data: {
          "name": name,
          "phone": phone,
          "password": password,
        },
      );

      return customerModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
