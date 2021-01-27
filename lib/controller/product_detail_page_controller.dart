import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/product_info_model.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/model/rating_model.dart';
import 'package:ayoo/model/shopping_cart_model.dart';
import 'package:ayoo/repo/remote/product_detail_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductDetailPageController extends GetxController {
  final ProductDetailApi _productDetailApi = ProductDetailApi();

  final HelperInstance helper = Get.find();
  final ProductPaginateController productRelatedController =
      Get.put(ProductPaginateController(), tag: 'ProductDetailPage');
  final ShoppingCartController shoppingCart = Get.find();

  final TextEditingController qtyField = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final PanelController panelController = PanelController();

  final ProductModel product = Get.arguments;
  final List<ProductInfoModel> productInfos = Get.arguments.productInfoModel;
  final List<RatingModel> ratings = Get.arguments.ratingModel;

  final _productDetail = ProductModel().obs;
  final loading = false.obs;

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
    productRelatedController.toggleFavourite(productId: product.productId);
  }

  ShoppingCartModel cartItem() {
    var index = shoppingCart.getCartItemIndex(product.productId);
    return (index >= 0)
        ? shoppingCart.shoppingCart[index]
        : ShoppingCartModel();
  }

  void init() {
    fetchProductDetail();
    fetchRelatedProduct();

    ever(shoppingCart.shoppingCart, (shop) {
      qtyField.text = cartItem().qty?.toString() ?? '0';
    });
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
