import 'package:ayoo/controller/account_page_controller.dart';
import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/controller/fcm_controller.dart';
import 'package:ayoo/controller/home_page_controller.dart';
import 'package:ayoo/controller/main_category_controller.dart';
import 'package:ayoo/controller/order_controller.dart';
import 'package:ayoo/controller/payment_channel_controller.dart';
import 'package:ayoo/controller/product_filter_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/controller/search_controller.dart';
import 'package:get/get.dart';

class AppPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(() => CustomerController());
    Get.lazyPut<FcmController>(() => FcmController());
    Get.lazyPut<CarouselBannerController>(() => CarouselBannerController());
    Get.lazyPut<MainCategoryController>(() => MainCategoryController());
    Get.lazyPut<ProductPaginateController>(() => ProductPaginateController());
    Get.lazyPut<ProductPaginateController>(() => ProductPaginateController(),
        tag: 'Popular');
    Get.lazyPut<SearchController>(() => SearchController(), tag: 'MostSearch');
    Get.lazyPut<ProductFilterController>(() => ProductFilterController(
        productController: Get.find<ProductPaginateController>()));
    Get.lazyPut<PaymentChannelController>(() => PaymentChannelController());
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut(() => AppPageController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => AccountPageCountroller());
  }
}
