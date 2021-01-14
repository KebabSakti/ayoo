import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShoppingCartPageControler extends GetxController {
  final HelperInstance helper = Get.find();
  final ShoppingCartController shoppingCartController = Get.find();

  final ScrollController scrollController = ScrollController();
}
