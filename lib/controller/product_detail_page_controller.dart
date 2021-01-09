import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/product_info_model.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/model/rating_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductDetailPageController extends GetxController {
  final HelperInstance helper = Get.find();
  final ProductPaginateController productRelatedController =
      Get.find(tag: Get.parameters['tag']);

  final ScrollController scrollController = ScrollController();
  final PanelController panelController = PanelController();

  final ProductModel product = Get.arguments;
  final List<ProductInfoModel> productInfos = Get.arguments.productInfoModel;
  final List<RatingModel> ratings = Get.arguments.ratingModel;

  void fetchRelatedProduct() {
    productRelatedController.loading.value = true;
    productRelatedController.setProductQuery(
        query: ProductQueryModel(subCategoryId: Get.arguments.subCategoryId));
  }

  void fetchProductDetail() {
    productRelatedController.detailLoading.value = true;
    productRelatedController.fetchProductDetail(productId: product.productId);
  }

  void toggleFavourite() {
<<<<<<< HEAD
    productRelatedController.favourite.value = false;
=======
>>>>>>> refactor-detail-page
    productRelatedController.toggleFavourite(productId: product.productId);
  }

  void init() {
    fetchProductDetail();
    fetchRelatedProduct();
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
