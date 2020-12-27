import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthApi {
  final _dio = Get.find<DioInstance>().dio;

  Future<AuthModel> requestGuestAccess() async {
    try {
      var response = await _dio.get('auth/customer/guest_access');

      return authModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
