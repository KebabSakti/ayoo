import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:dio/dio.dart';
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
}
