import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/controller/fcm_controller.dart';
import 'package:ayoo/controller/main_category_controller.dart';
import 'package:ayoo/controller/order_controller.dart';
import 'package:ayoo/controller/payment_channel_controller.dart';
import 'package:ayoo/controller/search_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/repo/remote/initial_home_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePageController extends GetxController {
  final _initialHomeApi = InitialHomeApi();

  final ScrollController scrollController = ScrollController();

  final CustomerController customerController = Get.find();
  final FcmController fcm = Get.find();
  final CarouselBannerController carouselBannerController = Get.find();
  final MainCategoryController mainCategoryController = Get.find();
  final ProductPaginateController productPaginatePopularController =
      Get.find(tag: 'Popular');
  final ProductPaginateController productPaginateController = Get.find();
  final SearchController searchController = Get.find(tag: 'MostSearch');
  final PaymentChannelController paymentChannelController = Get.find();
  final OrderController orderController = Get.find();

  final PanelController panelController =
      Get.find<AppPageController>().panelController;

  var loading = true.obs;
  var error = false.obs;

  Future fetchHomeData() async {
    loading.value = true;

    await _initialHomeApi.fetchInitialHome().then((data) async {
      customerController.setCustomer(data.customerModel);

      fcm.init();

      await carouselBannerController
          .setCarouselBanners(data.carouselBannerModel);
      await mainCategoryController.setMainCategories(data.mainCategoryModel);
      await productPaginatePopularController
          .setProductPaginateModel(data.productPopularPaginateModel);
      await productPaginateController
          .setProductPaginateModel(data.productPaginateModel);
      await searchController.setSearchModel(data.mostSearchModel);
      paymentChannelController.setPaymentChannel(data.paymentChannelModel);
      await orderController.fetchOrder();
    });

    loading.value = false;
  }

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
