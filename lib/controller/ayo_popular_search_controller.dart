import 'dart:math';

import 'package:ayoo/model/product_query_model.dart';
import 'package:get/get.dart';

class AyoPopularSearchController extends GetxController {
  void navigateToProductPage(String keyword) {
    Get.toNamed('/product/' + Random().nextInt(999999999).toString(),
        arguments: ProductQueryModel(keyword: keyword));
  }
}
