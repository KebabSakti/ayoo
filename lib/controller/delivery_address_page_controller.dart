import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/controller/order_summary_page_controller.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/repo/remote/delivery_address_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryAddressPageController extends GetxController {
  final DeliveryAddressApi _deliveryAddressApi = DeliveryAddressApi();

  final CustomerController customerController = Get.find();
  final OrderSummaryPageController summary = Get.find();

  final ScrollController scrollController = ScrollController();

  final origin = Get.arguments;
  final _deliveryAddress = List<DeliveryAddressModel>().obs;
  final loading = false.obs;

  List<DeliveryAddressModel> get address => _deliveryAddress;

  void setDeliveryAddress(List<DeliveryAddressModel> address) {
    customerController.customer.copyWith(deliveryAddressModel: address);
    _deliveryAddress.assignAll(address);
  }

  Future _fetchDeliveryAddress() async {
    loading.value = true;
    _deliveryAddressApi.fetchDeliveryAddress().then((result) {
      if (result != null) {
        setDeliveryAddress(result);
        loading.value = false;
      }
    });
  }

  Future _deleteDeliveryAddress(DeliveryAddressModel address) async {
    loading.value = true;
    _deliveryAddressApi.deleteDeliveryAddress(address).then((result) {
      if (result != null) {
        setDeliveryAddress(result);
        loading.value = false;
      }
    });
  }

  Future navigateToAddAddressPage({DeliveryAddressModel address}) async {
    var result =
        await Get.toNamed('/delivery_address_page/add', arguments: address);
    if (result != null) setDeliveryAddress(result);
  }

  void showAddressAction(DeliveryAddressModel address) {
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlatButton(
              onPressed: () {
                Get.back();
                navigateToAddAddressPage(address: address);
              },
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                ),
              ),
            ),
            Divider(height: 1),
            FlatButton(
              onPressed: () {
                Get.back();
                _deleteDeliveryAddress(address);
              },
              child: Text(
                'Hapus',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectDeliveryAddress(DeliveryAddressModel address) {
    if (origin == 'summary_page') Get.back(result: address);
  }

  void init() {
    _fetchDeliveryAddress();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
