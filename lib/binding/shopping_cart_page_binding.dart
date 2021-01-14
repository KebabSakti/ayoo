import 'package:ayoo/controller/shopping_cart_page_controller.dart';
import 'package:get/get.dart';

class ShoppingCartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingCartPageControler>(() => ShoppingCartPageControler());
  }
}
