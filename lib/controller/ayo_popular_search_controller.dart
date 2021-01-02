import 'package:ayoo/model/product_query_model.dart';
import 'package:get/get.dart';

class AyoPopularSearchController extends GetxController {
  void navigateToProductPage(String keyword) {
    Get.toNamed('/product', arguments: ProductQueryModel(keyword: keyword));
  }
}
