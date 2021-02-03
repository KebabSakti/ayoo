import 'package:ayoo/controller/delivery_address_page_controller.dart';
import 'package:get/get.dart';

class DeliveryAddressPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryAddressPageController>(
        () => DeliveryAddressPageController());
  }
}
