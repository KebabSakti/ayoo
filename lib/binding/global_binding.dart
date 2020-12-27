import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/controller/intro_banner_controller.dart';
import 'package:ayoo/controller/order_controller.dart';
import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioInstance>(DioInstance());
    Get.put<HelperInstance>(HelperInstance());
    Get.put<AuthController>(AuthController());
    Get.put<ShoppingCartController>(ShoppingCartController());
    Get.put<OrderController>(OrderController());
    Get.lazyPut<IntroBannerController>(() => IntroBannerController());
    //chat
    //notif
    //dynamic link
  }
}
