import 'package:ayoo/controller/contoh_controller.dart';
import 'package:get/get.dart';

class ContohBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ContohController>(ContohController(), tag: "Satu");
    Get.put<ContohController>(ContohController(), tag: "Tiga");
    Get.put<ContohController>(ContohController(), tag: "Dua");
  }
}
