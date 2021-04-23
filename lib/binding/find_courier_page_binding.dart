import 'package:ayoo/controller/find_courier_page_controller.dart';
import 'package:get/get.dart';

class FindCourierPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FindCourierPageController>(FindCourierPageController());
  }
}
