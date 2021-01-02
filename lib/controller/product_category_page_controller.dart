import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/product_filter_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductCategoryPageController extends GetxController {
  final CarouselBannerController carousel =
      Get.find(tag: 'ProductCategoryPage');
  final product =
      Get.find<ProductPaginateController>(tag: 'ProductCategoryPage');
  final productFilter =
      Get.find<ProductFilterController>(tag: 'ProductCategoryPageFilter');

  final PanelController panelController = PanelController();
  final ScrollController scrollController = ScrollController();

  final subCategories = Get.arguments.subCategoryModel;

  void initCarousel() {
    carousel.loading.value = true;
    carousel.fetchCarouselBanner(
        target: 'kategori', id: Get.arguments.mainCategoryId);
  }

  void initProduct() {
    product.loading.value = true;
    product.setProductQuery(
        query: ProductQueryModel(mainCategoryId: Get.arguments.mainCategoryId));
  }

  void init() {
    initCarousel();
    initProduct();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
