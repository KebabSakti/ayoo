import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final AuthController _authController = Get.find();

  final HelperInstance _helperInstance = Get.find();
  final CustomerController _customerController = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();

  Future login() async {
    if (formKey.currentState.validate()) {
      _helperInstance.loading();

      await _authController
          .login(phone: phoneField.text, password: passwordField.text)
          .then((result) {
        if (result != null) {
          _customerController.setCustomer(result);

          Get.offAllNamed('/');
        } else {
          Get.back();
          _helperInstance
              .showToast("Cek kembali kredensial yang anda inputkan");
        }
      });
    }
  }
}
