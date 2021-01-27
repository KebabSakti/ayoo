import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/model/mitra_model.dart';
import 'package:ayoo/model/shopping_cart_model.dart';
import 'package:get/get.dart';

class OrderSummaryPageController extends GetxController {
  final HelperInstance helper = Get.find();
  final CustomerController customerController = Get.find();

  final List<ShoppingCartModel> orderItems = Get.arguments;

  final _addressModel = DeliveryAddressModel().obs;
  final _mitraModel = List<MitraModel>().obs;

  DeliveryAddressModel get address => _addressModel.value;

  void setAddressModel(DeliveryAddressModel addressModel) {
    _addressModel.value = addressModel;
  }

  List<MitraModel> get mitras => _mitraModel;

  void setMitras(List<MitraModel> mitras) {
    _mitraModel.assignAll(mitras);
  }

  @override
  void onInit() {
    setAddressModel(customerController.customer.deliveryAddressModel
        .firstWhere((item) => item.isDefault > 0));

    super.onInit();
  }
}
