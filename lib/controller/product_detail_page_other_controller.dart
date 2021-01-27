import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/repo/remote/product_detail_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailPageOtherController extends GetxController {
  final ProductDetailApi _productDetailApi = ProductDetailApi();
  final ProductModel product = Get.arguments;
  final ScrollController scrollController = ScrollController();

  final HelperInstance helper = Get.find();
  final ProductPaginateController productRelated =
      Get.put(ProductPaginateController(), tag: 'ProductDetailPage');
  final ShoppingCartController shoppingCart = Get.find();

  final _productDetailModel = List<ProductModel>().obs;
  final loading = false.obs;
  final error = false.obs;

  List<ProductModel> get productDetail => _productDetailModel;

  void setProductDetailModel(List<ProductModel> productModel) {
    _productDetailModel.assignAll(productModel);
  }

  Future _fetchProductDetail() async {
    loading.value = true;
    error.value = false;
    await _productDetailApi
        .fetchProductDetail(productId: product.productId)
        .then((result) {
      if (result != null) {
        setProductDetailModel(result);
      } else {
        error.value = true;
      }

      loading.value = false;
    });
  }

  @override
  void onInit() {
    _fetchProductDetail();
    super.onInit();
  }
}
