import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/controller/payment_channel_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/customer_model.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/model/delivery_detail_model.dart';
import 'package:ayoo/model/mitra_model.dart';
import 'package:ayoo/model/order_model.dart';
import 'package:ayoo/model/order_summary_model.dart';
import 'package:ayoo/model/payment_channel_model.dart';
import 'package:ayoo/model/shopping_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class OrderSummaryPageController extends GetxController {
  final HelperInstance helper = Get.find();
  final PaymentChannelController paymentChannelController = Get.find();
  final CustomerController customerController = Get.find();
  final List<ShoppingCartModel> items = Get.arguments;
  final Rx<OrderSummaryModel> _orderSummary = OrderSummaryModel().obs;

  OrderSummaryModel get summary => _orderSummary.value;

  void setOrderSummary(OrderSummaryModel summary) {
    _orderSummary.value = summary;
  }

  void setCustomer(CustomerModel customer) {
    setOrderSummary(summary.copyWith(customer: customer));
  }

  void setDeliveryAddress(DeliveryAddressModel deliveryAddress) {
    setOrderSummary(summary.copyWith(deliveryAddress: deliveryAddress));
  }

  void setDeliveryDetail(List<DeliveryDetailModel> deliveryDetails) {
    setOrderSummary(summary.copyWith(deliveryDetails: deliveryDetails));
  }

  void setMitra(List<MitraModel> mitras) {
    setOrderSummary(summary.copyWith(mitras: mitras));
  }

  void setOrderItems(List<ShoppingCartModel> orderItems) {
    setOrderSummary(summary.copyWith(orderItems: orderItems));
  }

  void setPayment(PaymentChannelModel payment) {
    setOrderSummary(summary.copyWith(payment: payment));
  }

  void setOrder(OrderModel order) {
    setOrderSummary(summary.copyWith(summary: order));
  }

  List<String> getOrderTypes() {
    var ids = items.map((item) => item.product.deliveryTypeId).toList();
    return [
      ...{...ids}
    ];
  }

  double calculateShopTotal() {
    return summary.orderItems
        .fold(0, (value, element) => value + double.parse(element.total));
  }

  double calculateShippingTotal() {
    return summary.deliveryDetails
            ?.fold(0, (value, element) => value + double.parse(element.fee)) ??
        0;
  }

  double calculateAdminFee() {
    double total = calculateShopTotal() + calculateShippingTotal();
    return (summary.payment.channelCategory != "COD")
        ? (summary.payment.feeFix == null)
            ? (double.parse(summary.payment.feePercentage) / 100) * total
            : double.parse(summary.payment.feeFix)
        : 0;
  }

  void setOrderTotal() {
    setOrder(
      OrderModel(
        shopTotal: calculateShopTotal().toString(),
        deliveryTotal: calculateShippingTotal().toString(),
        adminFeeTotal: calculateAdminFee().toString(),
      ),
    );
  }

  double calculateGrandTotal() {
    return calculateShopTotal() +
        calculateShippingTotal() +
        calculateAdminFee();
  }

  Future requestLocationPermission(Function proceed) async {
    if (await Permission.location.isGranted == false) {
      Get.dialog(
        AlertDialog(
          title: Center(
            child: FaIcon(
              FontAwesomeIcons.mapMarkerAlt,
              color: Colors.redAccent,
              size: 40,
            ),
          ),
          content: Text(
            'Aplikasi memerlukan akses lokasi perangkat anda',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Batal'),
              onPressed: () {
                Get.back();
              },
            ),
            FlatButton(
              child: Text('Lanjut'),
              onPressed: () async {
                Get.back();
                if (await Permission.location.request().isGranted) {
                  proceed();
                } else {
                  helper.showToast('Izin lokasi di perlukan untuk melanjutkan');
                }
              },
            ),
          ],
        ),
      );
    } else {
      proceed();
    }
  }

  Future navigateToDeliveryAddressPage() async {
    var address =
        await Get.toNamed('/delivery_address_page', arguments: 'summary_page');
    if (address != null) setDeliveryAddress(address);
  }

  Future navigateToDeliveryDetailPage() async {
    requestLocationPermission(() async {
      var deliveryDetails = await Get.toNamed('/delivery_detail_page',
          arguments: getOrderTypes());
      if (deliveryDetails != null) setDeliveryDetail(deliveryDetails);
      setOrderTotal();
    });
  }

  Future navigateToPaymentChannelPage() async {
    var payment =
        await Get.toNamed('/payment_channel_page', arguments: summary.payment);
    if (payment != null) {
      setPayment(payment);
      setOrderTotal();
    }
  }

  void submitOrder() {}

  void init() {
    if (customerController.customer.deliveryAddressModel.length > 0)
      setDeliveryAddress(customerController.customer.deliveryAddressModel
          .firstWhere((item) => item.isDefault > 0));

    setOrderItems(items);

    setPayment(paymentChannelController.defaultPayment);

    setOrderTotal();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
