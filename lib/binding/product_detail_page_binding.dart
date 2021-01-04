import 'package:ayoo/controller/product_detail_page_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:get/get.dart';

class ProductDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPaginateController>(() => ProductPaginateController(),
        tag: 'ProductDetailPageRelated');
    Get.lazyPut<ProductDetailPageController>(
        () => ProductDetailPageController());
  }
}
