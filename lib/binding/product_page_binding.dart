import 'package:ayoo/controller/product_page_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:get/get.dart';

class ProductPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPaginateController>(() => ProductPaginateController(),
        tag: 'ProductPage');
    Get.lazyPut<ProductPageController>(() => ProductPageController());
  }
}
