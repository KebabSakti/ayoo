import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/initial_data_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class InitialDataApi {
  final _dio = Get.find<DioInstance>();

  Future<InitialDataModel> fetchInitialData() async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .get('initial_page');

      return initialDataModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
