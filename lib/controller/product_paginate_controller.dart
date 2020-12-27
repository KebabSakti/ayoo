import 'package:ayoo/model/product_paginate_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/repo/remote/product_paginate_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPaginateController extends GetxController {
  final _productPaginateApi = ProductPaginateApi();

  final productPaginateModel = ProductPaginateModel().obs;
  final productQueryModel = ProductQueryModel().obs;
  final loading = true.obs;
  final error = false.obs;

  Future fetchPaginateProduct() async {
    loading.value = true;
    error.value = false;

    await _productPaginateApi
        .fetchPaginateProduct(query: productQueryModel.value)
        .then((product) {
      if (product != null) {
        setProductPaginateModel(product);
      } else {
        error.value = true;
      }
    });

    loading.value = false;
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
}
