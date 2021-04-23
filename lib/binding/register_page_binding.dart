import 'package:ayoo/controller/register_page_controller.dart';
import 'package:get/get.dart';

class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterPageController>(RegisterPageController());
  }
}
