import 'package:ayoo/controller/order_controller.dart';
import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/model/order_model.dart';
import 'package:ayoo/repo/remote/order_api.dart';
import 'package:get/get.dart';

class PlaceOrderPageController extends GetxController {
  final OrderApi _orderApi = OrderApi();
  final OrderModel order = Get.arguments;
  final ShoppingCartController cart = Get.find();
  final OrderController orderController = Get.find();

  final loading = true.obs;

  void setLoading(bool value) {
    loading.value = value;
  }

  Future _makeOrder() async {
    await _orderApi.createOrder(order: order).then((result) async {
      if (result != null) {
        orderController.setOrders(result);
        if (order.clearShoppingCart) {
          await cart.clearShoppingCart();
        }
        setLoading(false);
      }
    });
  }

  void navigateToHome() {
    Get.offNamed('/app');
  }

  @override
  void onInit() {
    _makeOrder();
    super.onInit();
  }
}
