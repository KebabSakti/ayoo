import 'package:ayoo/model/customer_model.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final _customerModel = CustomerModel().obs;

  CustomerModel get customer => _customerModel.value;

  void setCustomer(CustomerModel customerModel) {
    _customerModel.value = customerModel;
  }
}
