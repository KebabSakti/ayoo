import 'package:ayoo/controller/payment_channel_page_controller.dart';
import 'package:get/get.dart';

class PaymentChannelPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentChannelPageController>(
        () => PaymentChannelPageController());
  }
}
