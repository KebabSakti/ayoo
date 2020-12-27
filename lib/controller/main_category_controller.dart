import 'package:ayoo/model/main_category_model.dart';
import 'package:get/get.dart';

class MainCategoryController extends GetxController {
  var mainCategories = List<MainCategoryModel>().obs;

  Future setMainCategories(List<MainCategoryModel> categories) async {
    mainCategories.assignAll(categories);
  }
}
