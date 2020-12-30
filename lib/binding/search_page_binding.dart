import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/controller/search_controller.dart';
import 'package:ayoo/controller/search_page_controller.dart';
import 'package:get/get.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPaginateController>(() => ProductPaginateController(),
        tag: 'LastSeen');
    Get.lazyPut<ProductPaginateController>(() => ProductPaginateController(),
        tag: 'SearchProduct');
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<SearchController>(() => SearchController(), tag: 'History');
    Get.lazyPut<SearchController>(() => SearchController(), tag: 'Popular');
    Get.put<SearchPageController>(SearchPageController());
  }
}
