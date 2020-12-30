import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/controller/search_controller.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/model/search_query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final lastSeenProduct = Get.find<ProductPaginateController>(tag: 'LastSeen');
  final searchProduct =
      Get.find<ProductPaginateController>(tag: 'SearchProduct');
  final searchController = Get.find<SearchController>();
  final searchHistory = Get.find<SearchController>(tag: 'History');
  final searchPopular = Get.find<SearchController>(tag: 'Popular');

  final TextEditingController searchField = TextEditingController();

  void _search(String keyword) {
    searchController.loading.value = true;
    searchController.setSearchQuery(query: SearchQuery(keyword: keyword));
  }

  void _searchFieldListener() {
    _search(searchField.text);
  }

  void _fetchlastSeenProduct() {
    lastSeenProduct.loading.value = true;
    lastSeenProduct.setProductQuery(
        query: ProductQueryModel(seen: 1, sorting: 'latest'));
  }

  void _fetchSearchHistory() {
    searchHistory.loading.value = true;
    searchHistory.setSearchQuery(query: SearchQuery(history: true));
  }

  void _fetchPopularSearch() {
    searchPopular.loading.value = true;
    searchPopular.setSearchQuery(query: SearchQuery());
  }

  Future init() async {
    _fetchlastSeenProduct();
    _fetchSearchHistory();
    _fetchPopularSearch();
  }

  @override
  void onInit() {
    searchField.addListener(_searchFieldListener);

    init();
    super.onInit();
  }
}
