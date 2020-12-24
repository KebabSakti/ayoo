import 'package:ayoo/controller/intro_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IntroController>(IntroController());
  }
}
