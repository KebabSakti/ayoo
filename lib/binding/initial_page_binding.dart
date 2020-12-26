import 'package:ayoo/controller/initial_page_controller.dart';
import 'package:get/get.dart';

class InitialPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InitialPageController>(InitialPageController());
  }
}
