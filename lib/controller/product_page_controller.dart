import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductPageController extends GetxController {
  final productController =
      Get.find<ProductPaginateController>(tag: 'ProductPage');
  final ScrollController scrollController = ScrollController();

  void init() {
    productController.loading.value = true;
    productController.setProductQuery(query: Get.arguments);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
