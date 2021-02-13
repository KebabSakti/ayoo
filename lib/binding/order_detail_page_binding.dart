import 'package:ayoo/controller/order_detail_page_controller.dart';
import 'package:get/get.dart';

class OrderDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrderDetailPageController>(OrderDetailPageController());
  }
}
