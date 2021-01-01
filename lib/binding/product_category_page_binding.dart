import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/product_category_page_controller.dart';
import 'package:ayoo/controller/product_filter_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:get/get.dart';

class ProductCategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarouselBannerController>(() => CarouselBannerController(),
        tag: 'ProductCategoryPage');
    Get.lazyPut<ProductPaginateController>(() => ProductPaginateController(),
        tag: 'ProductCategoryPage');
    Get.lazyPut<ProductFilterController>(
        () => ProductFilterController(
            productController: Get.find<ProductPaginateController>(
                tag: 'ProductCategoryPage')),
        tag: 'ProductCategoryPageFilter');
    Get.lazyPut<ProductCategoryPageController>(
        () => ProductCategoryPageController());
  }
}
