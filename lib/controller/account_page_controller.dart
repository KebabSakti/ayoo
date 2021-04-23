import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/repo/remote/auth_api.dart';
import 'package:get/get.dart';

class AccountPageCountroller extends GetxController {
  final AuthController _authController = AuthController();

  final HelperInstance _helperInstance = Get.find();
  final CustomerController customerController = Get.find();

  Future logout() async {
    _authController.logout();
  }
}
