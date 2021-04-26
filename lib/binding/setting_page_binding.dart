import 'package:ayoo/controller/setting_page_controller.dart';
import 'package:get/get.dart';

class SettingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingPageController>(SettingPageController());
  }
}
