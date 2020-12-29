import 'package:ayoo/model/product_paginate_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/repo/remote/product_paginate_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPaginateController extends GetxController {
  final _productPaginateApi = ProductPaginateApi();

  final scrollController = ScrollController();
  final productPaginateModel = ProductPaginateModel().obs;
  final productQueryModel = ProductQueryModel().obs;

  final loading = false.obs;
  final moreLoading = false.obs;
  final moreError = false.obs;
  final error = false.obs;

  final sort = <String>[""];

  Future fetchPaginateProduct() async {
    loading.value = true;
    error.value = false;

    await _productPaginateApi
        .fetchPaginateProduct(query: productQueryModel.value, page: 1)
        .then((product) {
      if (product != null) {
        setProductPaginateModel(product);
      } else {
        error.value = true;
      }

      loading.value = false;
    });
  }

  Future fetchMorePaginateProduct() async {
    if (productPaginateModel.value.to < productPaginateModel.value.total) {
      moreLoading.value = true;
      moreError.value = false;

      await _productPaginateApi
          .fetchPaginateProduct(
              query: productQueryModel.value,
              page: productPaginateModel.value.currentPage++)
          .then((product) {
        if (product != null) {
          productPaginateModel.update((val) {
            val.data.addAll(product.data);
          });
        } else {
          moreError.value = true;
        }

        moreLoading.value = false;
      });
    }
  }

  Future setProductPaginateModel(ProductPaginateModel productPaginate) async {
    productPaginateModel.value = productPaginate;
  }

  void setProductQuery({@required ProductQueryModel query}) {
    productQueryModel.value = query;
  }

  @override
  void onInit() {
    debounce(productQueryModel, (_) {
      fetchPaginateProduct();
    }, time: Duration(milliseconds: 300));

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
