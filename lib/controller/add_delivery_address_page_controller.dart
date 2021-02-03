import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/repo/remote/delivery_address_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDeliveryAddressPageController extends GetxController {
  final DeliveryAddressApi _deliveryAddressApi = DeliveryAddressApi();

  final HelperInstance helper = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();

  final DeliveryAddressModel selectedAddress = Get.arguments;
  final loading = false.obs;

  Future _addDeliveryAddress() async {
    loading.value = true;
    _deliveryAddressApi
        .addDeliveryAddress(DeliveryAddressModel(
      title: title.text,
      name: name.text,
      phone: phone.text,
      address: address.text,
    ))
        .then((address) {
      if (address != null) {
        loading.value = false;
        Get.back(result: address, closeOverlays: true);
      }
    });
  }

  Future _updateDeliveryAddress() async {
    loading.value = true;
    _deliveryAddressApi
        .updateDeliveryAddress(
            DeliveryAddressModel(
              title: title.text,
              name: name.text,
              phone: phone.text,
              address: address.text,
            ),
            selectedAddress.deliveryAddressId)
        .then((address) {
      if (address != null) {
        loading.value = false;
        Get.back(result: address, closeOverlays: true);
      }
    });
  }

  void submitForm() {
    if (formKey.currentState.validate()) {
      Get.dialog(
        AlertDialog(
          title: Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.grey[100],
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Loading..',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );

      if (selectedAddress == null) {
        _addDeliveryAddress();
      } else {
        _updateDeliveryAddress();
      }
    }
  }

  void _init() {
    if (selectedAddress != null) {
      title.text = selectedAddress.title;
      name.text = selectedAddress.name;
      phone.text = selectedAddress.phone;
      address.text = selectedAddress.address;
    }
  }

  void _dispose() {
    title.dispose();
    name.dispose();
    phone.dispose();
    address.dispose();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  @override
  void onClose() {
    _dispose();
    super.onClose();
  }
}
