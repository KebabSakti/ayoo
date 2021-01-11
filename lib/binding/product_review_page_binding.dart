import 'package:ayoo/controller/product_review_page_controller.dart';
import 'package:get/get.dart';

class ProductReviewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductReviewPageController>(
        () => ProductReviewPageController());
  }
}
