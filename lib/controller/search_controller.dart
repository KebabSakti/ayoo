import 'package:ayoo/model/search_model.dart';
import 'package:ayoo/model/search_query.dart';
import 'package:ayoo/repo/remote/search_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final _searchApi = SearchApi();

  final searchModel = List<SearchModel>().obs;
  final searchQuery = SearchQuery().obs;

  final loading = false.obs;
  final error = false.obs;

  Future _search() async {
    loading.value = true;
    error.value = false;

    await _searchApi.search(searchQuery: searchQuery.value).then((searchs) {
      if (searchs != null) {
        setSearchModel(searchs);
      } else {
        error.value = true;
      }

      loading.value = false;
    });
  }

  Future clearSearchHistory() async {
    loading.value = true;
    error.value = false;

    await _searchApi.clearSearchHistory().then((status) {
      if (status != null) {
        setSearchModel([]);
      } else {
        error.value = true;
      }

      loading.value = false;
    });
  }

  Future saveSearchHistory({@required String keyword}) async {
    await _searchApi.saveSearchHistory(keyword: keyword);
  }

  Future setSearchModel(List<SearchModel> searches) async {
    searchModel.assignAll(searches);
  }

  void setSearchQuery({@required SearchQuery query}) {
    searchQuery(query);
  }

  @override
  void onInit() {
    debounce(searchQuery, (_) {
      _search();
    }, time: Duration(seconds: 1));

    super.onInit();
  }
}
