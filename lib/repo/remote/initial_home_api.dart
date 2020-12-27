import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/initial_home_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class InitialHomeApi {
  final _dio = Get.find<DioInstance>();

  Future<InitialHomeModel> fetchInitialHome() async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .get('initial_home');

      return initialHomeModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
