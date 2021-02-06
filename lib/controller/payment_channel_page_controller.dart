import 'package:ayoo/controller/payment_channel_controller.dart';
import 'package:ayoo/model/payment_channel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentChannelPageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final PaymentChannelController paymentController = Get.find();

  final PaymentChannelModel activePayment = Get.arguments;
  final _selected = PaymentChannelModel().obs;

  PaymentChannelModel get selectedPaymend => _selected.value;

  void setSelectedPayment(PaymentChannelModel payment) {
    _selected.value = payment;
  }

  void selectPayment(PaymentChannelModel payment) {
    setSelectedPayment(payment);
    Get.back(result: payment);
  }

  void init() {
    setSelectedPayment(activePayment);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
