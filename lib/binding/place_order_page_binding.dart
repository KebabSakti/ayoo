import 'package:ayoo/controller/place_order_page_controller.dart';
import 'package:get/get.dart';

class PlaceOrderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceOrderPageController>(() => PlaceOrderPageController());
  }
}
