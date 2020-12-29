import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AyoVerticalProductController extends GetxController {
  final ScrollController scrollController;
  final ProductPaginateController productPaginateController;

  AyoVerticalProductController({
    @required this.scrollController,
    @required this.productPaginateController,
  });

  void scrollToTop() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeIn,
    );
  }

  void _scrollListener() {
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      productPaginateController.fetchMorePaginateProduct();
    }
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
}
