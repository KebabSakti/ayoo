import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductFilterController extends GetxController {
  final ProductPaginateController productController;

  ProductFilterController({@required this.productController});

  final ScrollController scrollController = ScrollController();

  final filter = [
    Filter(
        key: 'terlaris', title: 'Paling Laku', selected: false, tag: 'filter'),
    Filter(key: 'diskon', title: 'Lagi Diskon', selected: false, tag: 'filter'),
    Filter(
        key: 'search', title: 'Paling di Cari', selected: false, tag: 'filter'),
    Filter(key: 'view', title: 'Lagi Trending', selected: false, tag: 'filter'),
    Filter(key: 'rating', title: '4 Ke atas', selected: false, tag: 'filter'),
    Filter(
        key: 'cheapest',
        title: 'Harga Terendah',
        selected: false,
        tag: 'sorting'),
    Filter(
        key: 'expensive',
        title: 'Harga Tertinggi',
        selected: false,
        tag: 'sorting'),
    Filter(key: 'latest', title: 'Terbaru', selected: false, tag: 'sorting'),
    Filter(
        key: 'instant', title: 'Instant', selected: false, tag: 'pengiriman'),
    Filter(
        key: 'terjadwal',
        title: 'Terjadwal',
        selected: false,
        tag: 'pengiriman'),
  ].obs;

  void setFilter(Filter filter, bool v) {
    var q = productController.productQueryModel.value;
    productController.setProductQuery(
      query: ProductQueryModel(
        terlaris: (filter.key == 'terlaris')
            ? (v)
                ? 1
                : 0
            : q.terlaris,
        diskon: (filter.key == 'diskon')
            ? (v)
                ? 1
                : 0
            : q.diskon,
        search: (filter.key == 'search')
            ? (v)
                ? 1
                : 0
            : q.search,
        view: (filter.key == 'view')
            ? (v)
                ? 1
                : 0
            : q.view,
        rating: (filter.key == 'rating')
            ? (v)
                ? 4
                : 0
            : q.view,
        sorting: (filter.key == 'cheapest' ||
                filter.key == 'expensive' ||
                filter.key == 'latest')
            ? (v)
                ? filter.key
                : null
            : q.sorting,
        pengiriman: (filter.key == 'instant' || filter.key == 'terjadwal')
            ? (v)
                ? filter.key
                : null
            : q.pengiriman,
      ),
    );

    this.filter.assignAll(this.filter.map((item) {
          if (item.key == filter.key) {
            return filter.copyWith(selected: v);
          } else {
            if (item.tag == 'sorting' &&
                (filter.key == 'cheapest' ||
                    filter.key == 'expensive' ||
                    filter.key == 'latest')) {
              return item.copyWith(selected: false);
            }
            if (item.tag == 'pengiriman' &&
                (filter.key == 'instant' || filter.key == 'terjadwal')) {
              return item.copyWith(selected: false);
            }
            return item;
          }
        }).toList());
  }

  @override
  void onInit() {
    super.onInit();
  }
}

class Filter {
  String key;
  String title;
  bool selected;
  String tag;

  Filter({this.key, this.title, this.selected, this.tag});

  Filter copyWith({
    String key,
    String title,
    bool selected,
    String tag,
  }) =>
      Filter(
        key: key ?? this.key,
        title: title ?? this.title,
        selected: selected ?? this.selected,
        tag: tag ?? this.tag,
      );
}
