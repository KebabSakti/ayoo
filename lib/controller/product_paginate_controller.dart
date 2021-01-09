import 'package:ayoo/model/product_model.dart';
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
  final productModel = List<ProductModel>().obs;

  final loading = false.obs;
  final moreLoading = false.obs;
  final moreError = false.obs;
  final error = false.obs;
  final favourite = false.obs;
  final detailLoading = false.obs;
  final detailError = false.obs;

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

  Future fetchProductDetail({@required String productId}) async {
    detailLoading.value = true;
    detailError.value = false;

    await _productPaginateApi
        .fetchProductDetail(productId: productId)
        .then((product) {
      if (product != null) {
        setProductDetail(product);
      } else {
        detailError.value = true;
      }

      detailLoading.value = false;
    });
  }

  Future fetchMorePaginateProduct() async {
    if (productPaginateModel.value.nextPageUrl != null) {
      moreLoading.value = true;
      moreError.value = false;

      await _productPaginateApi
          .fetchPaginateProduct(
              query: productQueryModel.value,
              page: productPaginateModel.value.currentPage + 1)
          .then((product) {
        if (product != null) {
          productPaginateModel.update((val) {
            val.currentPage = product.currentPage;
            val.firstPageUrl = product.firstPageUrl;
            val.from = product.from;
            val.lastPage = product.lastPage;
            val.lastPageUrl = product.lastPageUrl;
            val.nextPageUrl = product.nextPageUrl;
            val.prevPageUrl = product.prevPageUrl;
            val.path = product.path;
            val.perPage = product.perPage;
            val.to = product.to;
            val.total = product.total;
            val.data.addAll(product.data);
          });
        } else {
          moreError.value = true;
        }

        moreLoading.value = false;
      });
    }
  }

  Future addProductView({@required String productId}) async {
    await _productPaginateApi.addProductView(productId: productId);
  }

  Future toggleFavourite({@required String productId}) async {
    await _productPaginateApi
        .toggleFavourite(productId: productId)
        .then((product) {
      if (product != null) {
        setProductDetail(product);
      }
    });
  }

  // Future isFavourite({@required String productId}) async {
  //   await _productPaginateApi
  //       .toggleFavourite(productId: productId)
  //       .then((value) => favourite.value = value);
  // }

  Future setProductPaginateModel(ProductPaginateModel productPaginate) async {
    productPaginateModel.value = productPaginate;
  }

  void setProductDetail(List<ProductModel> products) {
    productModel.assignAll(products);
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
