import 'package:ayoo/controller/initial_page_controller.dart';
import 'package:ayoo/controller/intro_banner_controller.dart';
import 'package:get/get.dart';

class InitialPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IntroBannerController>(IntroBannerController());
    Get.put<InitialPageController>(InitialPageController());
  }
}
