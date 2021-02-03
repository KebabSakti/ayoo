import 'package:ayoo/controller/add_delivery_address_page_controller.dart';
import 'package:get/get.dart';

class AddDeliveryAddressPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDeliveryAddressPageController>(
        () => AddDeliveryAddressPageController());
  }
}
