import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductPageController extends GetxController {
  final ProductPaginateController productController =
      Get.find(tag: Get.parameters['tag']);

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

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
