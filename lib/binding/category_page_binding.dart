import 'package:ayoo/controller/category_page_controller.dart';
import 'package:get/get.dart';

class CategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryPageController>(() => CategoryPageController());
  }
}
