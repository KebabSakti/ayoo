import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/controller/home_page_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioInstance>(DioInstance());
    Get.lazyPut(() => AppPageController());
    Get.lazyPut(() => HomePageController());
  }
}
