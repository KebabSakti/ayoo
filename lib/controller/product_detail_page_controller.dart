import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/order_detail_model.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/model/shopping_cart_model.dart';
import 'package:ayoo/repo/remote/product_detail_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductDetailPageController extends GetxController {
  final ProductDetailApi _productDetailApi = ProductDetailApi();

  final ScrollController scrollController = ScrollController();
  final PanelController panelController = PanelController();
  final PanelController beliLangsungPanel = PanelController();
  final TextEditingController qtyField = TextEditingController();
  final TextEditingController noteField = TextEditingController();

  final HelperInstance helper = Get.find();
  final ProductPaginateController productRelated =
      Get.put(ProductPaginateController(), tag: 'ProductDetailPage');
  final ShoppingCartController shoppingCart = Get.find();

  final ProductModel product = Get.arguments;

  final stacks = List<ProductModel>().obs;

  final _productDetailModel = List<ProductModel>().obs;
  final loading = false.obs;
  final error = false.obs;

  ProductModel get productDetail => _productDetailModel[0];

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

  void _fetchRelatedProduct() {
    productRelated.loading.value = true;
    productRelated.setProductQuery(
        query: ProductQueryModel(subCategoryId: product.subCategoryId));
  }

  ShoppingCartModel cartItem() {
    var index = shoppingCart.getCartItemIndex(product.productId);
    return (index >= 0)
        ? shoppingCart.shoppingCart[index]
        : ShoppingCartModel();
  }

  Future toggleFavourite() async {
    await _productDetailApi
        .toggleFavourite(productId: product.productId)
        .then((result) {
      if (result != null) setProductDetailModel(result);
      if (result[0].favouriteModel.length > 0)
        helper.showToast('Sukses menambah favorit');
      else
        helper.showToast('Sukses menghapus favorit');
    });
  }

  void navigateToOrderSummaryPage() {
    Get.toNamed(
      '/order_summary',
      arguments: [
        OrderDetailModel(
          productId: product.productId,
          qty: 1,
          total: product.lastPrice,
          product: product,
          note: noteField.text,
        )
      ],
    );
  }

  @override
  void onInit() {
    _fetchProductDetail();

    qtyField.text = cartItem().qty?.toString() ?? '0';

    ever(_productDetailModel, (_) {
      _fetchRelatedProduct();
    });

    ever(shoppingCart.shoppingCart, (shop) {
      qtyField.text = cartItem().qty?.toString() ?? '0';
    });
    super.onInit();
  }
}
