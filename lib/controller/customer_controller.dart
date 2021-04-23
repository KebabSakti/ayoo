import 'package:ayoo/model/customer_model.dart';
import 'package:ayoo/repo/remote/customer_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final CustomerApi _customerApi = CustomerApi();

  final _customerModel = CustomerModel().obs;

  CustomerModel get customer => _customerModel.value;

  void setCustomer(CustomerModel customerModel) {
    _customerModel.value = customerModel;
  }

  void status({@required String status}) async {
    await _customerApi.status(status: status).then((result) {
      if (result != null) setCustomer(result);
    });
  }
}
