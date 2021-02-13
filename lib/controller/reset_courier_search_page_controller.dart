import 'package:ayoo/controller/order_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:get/get.dart';

class ResetCourierSearchPageController extends GetxController {
  final OrderController _orderController = Get.find();
  final HelperInstance _helper = Get.find();

  final payload = Get.arguments;

  void resetRequestQueue() {
    _orderController.resetRequestQueue(payload['sale_id']);
    _helper.showToast(
        'Sedang mencari kurir.. Kami akan segera memberikan info ke anda');
    Get.back();
  }
}
