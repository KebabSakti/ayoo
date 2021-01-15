import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShoppingCartPageControler extends GetxController {
  final HelperInstance helper = Get.find();
  final ShoppingCartController shoppingCartController = Get.find();
  final ScrollController scrollController = ScrollController();

  List<TextEditingController> textFieldControllers = [];

  void plusQty(int index, ProductModel productModel) {
    var index = shoppingCartController.getCartItemIndex(productModel.productId);
    shoppingCartController.plusQty(product: productModel);
    textFieldControllers[index].text =
        shoppingCartController.shoppingCart[index].qty.toString();
  }

  void minQty(int index, ProductModel productModel) {
    var index = shoppingCartController.getCartItemIndex(productModel.productId);
    shoppingCartController.minQty(product: productModel);
    textFieldControllers[index].text =
        shoppingCartController.shoppingCart[index]?.qty.toString();
  }

  void init() {
    textFieldControllers = shoppingCartController.shoppingCart
        .map((i) => TextEditingController(text: i.qty.toString()))
        .toList();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
