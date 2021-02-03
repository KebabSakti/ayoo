import 'package:ayoo/controller/order_summary_page_controller.dart';
import 'package:ayoo/controller/payment_channel_controller.dart';
import 'package:get/get.dart';

class OrderSummaryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderSummaryPageController>(() => OrderSummaryPageController());
  }
}
