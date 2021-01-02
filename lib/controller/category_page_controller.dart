import 'package:ayoo/controller/main_category_controller.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:get/get.dart';

class CategoryPageController extends GetxController {
  final MainCategoryController category = Get.find();

  final active = 0.obs;

  void setActive(int index) => active.value = index;

  void navigateToProductPage(String subCategoryId) {
    Get.toNamed('/product',
        arguments: ProductQueryModel(subCategoryId: subCategoryId));
  }
}
