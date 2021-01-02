import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/controller/search_controller.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/model/search_query.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final lastSeenProduct = Get.find<ProductPaginateController>(tag: 'LastSeen');
  final searchProduct =
      Get.find<ProductPaginateController>(tag: 'SearchProduct');
  final searchController = Get.find<SearchController>();
  final searchHistory = Get.find<SearchController>(tag: 'History');
  final searchPopular = Get.find<SearchController>(tag: 'Popular');

  final ScrollController scrollController = ScrollController();
  final TextEditingController searchField = TextEditingController();

  final searchMode = false.obs;
  final keyword = "".obs;

  void _search() {
    if (searchMode.value) {
      searchController.loading.value = true;
      searchController.setSearchQuery(
          query: SearchQuery(keyword: keyword.value));
    }
  }

  void _searchFieldListener() {
    if ((searchField.text.length > 0)) {
      searchMode.value = true;
      keyword.value = searchField.text;
    } else {
      searchMode.value = false;
    }
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

  void clearSearchHistory() {
    searchHistory.loading.value = true;
    searchHistory.clearSearchHistory();
  }

  void saveSearchHistory({@required String keyword}) {
    searchController.saveSearchHistory(keyword: keyword);
  }

  void clearSearchKeyword() {
    searchField.text = '';
    searchMode.value = false;
  }

  void navigateToProduct({@required String keyword}) {
    if (keyword.length > 0) {
      saveSearchHistory(keyword: keyword);
      Get.offNamed('/product', arguments: ProductQueryModel(keyword: keyword));
    }
  }

  Future init() async {
    _fetchlastSeenProduct();
    _fetchSearchHistory();
    _fetchPopularSearch();
  }

  @override
  void onInit() {
    searchField.addListener(_searchFieldListener);
    debounce(keyword, (_) {
      _search();
    }, time: Duration(seconds: 1));

    init();
    super.onInit();
  }
}
