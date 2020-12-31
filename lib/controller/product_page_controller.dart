import 'package:ayoo/controller/product_filter_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductPageController extends GetxController {
  final productController =
      Get.find<ProductPaginateController>(tag: 'ProductPage');
  final productFilterController =
      Get.find<ProductFilterController>(tag: 'ProductPageFilter');

  final PanelController panelController = PanelController();
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
