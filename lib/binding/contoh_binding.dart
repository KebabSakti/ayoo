import 'package:ayoo/controller/contoh_controller.dart';
import 'package:get/get.dart';

class ContohBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContohController>(() => ContohController());
    // Get.put<ContohController>(ContohController(), tag: "Tiga");
    // Get.put<ContohController>(ContohController(), tag: "Dua");
  }
}
