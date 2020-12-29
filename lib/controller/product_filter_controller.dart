import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductFilterController extends GetxController {
  final ProductPaginateController productController;

  ProductFilterController({@required this.productController});

  final filter = [
    Filter(key: 'terlaris', title: 'Paling Laku', value: 1, selected: false),
    Filter(key: 'diskon', title: 'Lagi Diskon', value: 1, selected: false),
    Filter(key: 'search', title: 'Paling di Cari', value: 1, selected: false),
  ].obs;
}

class Filter {
  final String key, title;
  final int value;
  final bool selected;

  Filter({this.key, this.title, this.value, this.selected});
}
