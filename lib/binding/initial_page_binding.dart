import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/controller/initial_page_controller.dart';
import 'package:ayoo/controller/intro_banner_controller.dart';
import 'package:ayoo/controller/order_controller.dart';
import 'package:ayoo/controller/setting_controller.dart';
import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:get/get.dart';

class InitialPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioInstance>(() => DioInstance(), fenix: true);
    Get.lazyPut<HelperInstance>(() => HelperInstance(), fenix: true);
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.put<SettingController>(SettingController(), permanent: true);
    Get.lazyPut<ShoppingCartController>(
      () => ShoppingCartController(),
      fenix: true,
    );
    Get.lazyPut<OrderController>(() => OrderController(), fenix: true);
    Get.lazyPut<IntroBannerController>(() => IntroBannerController());
    Get.lazyPut<InitialPageController>(() => InitialPageController());
  }
}
