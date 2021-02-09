import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/checkout_item_model.dart';
import 'package:ayoo/model/order_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartPageControler extends GetxController {
  final HelperInstance helper = Get.find();
  final ShoppingCartController shoppingCartController = Get.find();
  final ScrollController scrollController = ScrollController();

  void navigateToOrderSummaryPage() {
    Get.toNamed(
      '/order_summary',
      arguments: CheckoutItemModel(
        items: shoppingCartController.shoppingCart
            .map((item) => OrderDetailModel(
                  productId: item.productId,
                  qty: item.qty,
                  total: item.total,
                  product: item.product,
                  note: item.note,
                ))
            .toList(),
        clearShoppingCart: true,
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
  }
}
