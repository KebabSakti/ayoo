import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/home_page_controller.dart';
import 'package:ayoo/controller/main_category_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/controller/search_controller.dart';
import 'package:get/get.dart';

class AppPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CarouselBannerController>(CarouselBannerController());
    Get.put<MainCategoryController>(MainCategoryController());
    Get.put<ProductPaginateController>(ProductPaginateController());
    Get.put<ProductPaginateController>(ProductPaginateController(),
        tag: 'Popular');
    Get.put<SearchController>(SearchController(), tag: 'MostSearch');
    Get.put(AppPageController());
    Get.put(HomePageController());
  }
}
