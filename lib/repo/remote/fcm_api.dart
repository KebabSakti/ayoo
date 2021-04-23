import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FcmApi {
  final DioInstance _dio = Get.find();

  Future<bool> registerFcmToken({String fcmToken}) async {
    try {
      await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('fcm/register', data: {'fcm_token': fcmToken});

      return true;
    } on DioError catch (_) {
      return null;
    }
  }

  Future<bool> send(
      {@required String customerId, @required String fcmToken}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post(
        'fcm/send',
        data: {
          'customer_id': customerId,
          'fcm_token': fcmToken,
        },
      );

      return response.data;
    } on DioError catch (_) {
      return null;
    }
  }
}
