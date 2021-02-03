import 'package:ayoo/controller/delivery_detail_page_controller.dart';
import 'package:ayoo/controller/google_place_controller.dart';
import 'package:get/get.dart';

class DeliveryDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GooglePlaceController>(() => GooglePlaceController());
    Get.lazyPut<DeliveryDetailPageController>(
        () => DeliveryDetailPageController());
  }
}
