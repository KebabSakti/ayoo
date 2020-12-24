import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/controller/intro_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioInstance>(DioInstance());
    Get.put<AuthController>(AuthController());
  }
}
