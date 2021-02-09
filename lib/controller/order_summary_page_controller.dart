import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/controller/payment_channel_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/customer_model.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/model/delivery_mitra_model.dart';
import 'package:ayoo/model/order_detail_model.dart';
import 'package:ayoo/model/order_model.dart';
import 'package:ayoo/model/payment_channel_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class OrderSummaryPageController extends GetxController {
  final HelperInstance helper = Get.find();
  final PaymentChannelController paymentChannelController = Get.find();
  final CustomerController customerController = Get.find();
  final List<OrderDetailModel> items = Get.arguments.items;
  final bool clearShoppingCart = Get.arguments.clearShoppingCart;
  final Rx<OrderModel> _orderModel = OrderModel().obs;

  OrderModel get order => _orderModel.value;

  void setOrderSummary(OrderModel order) {
    _orderModel.value = order;
  }

  void setCustomer(CustomerModel customer) {
    setOrderSummary(order.copyWith(customerModel: customer));
  }

  void setDeliveryAddress(DeliveryAddressModel deliveryAddress) {
    setOrderSummary(order.copyWith(deliveryAddressModel: deliveryAddress));
  }

  void setMitra(List<DeliveryMitraModel> mitras) {
    setOrderSummary(order.copyWith(deliveryMitraModel: mitras));
  }

  void setOrderItems(List<OrderDetailModel> orderItems) {
    setOrderSummary(order.copyWith(orderDetailModel: orderItems));
  }

  void setPayment(PaymentChannelModel payment) {
    setOrderSummary(order.copyWith(paymentChannelModel: payment));
  }

  void setClearCartRule() {
    setOrderSummary(order.copyWith(clearShoppingCart: clearShoppingCart));
  }

  List<String> getOrderTypes() {
    var ids = order.orderDetailModel
        .map((item) => item.product.deliveryTypeId)
        .toList();
    return [
      ...{...ids}
    ];
  }

  double calculateShopTotal() {
    return order.orderDetailModel
        .fold(0, (value, element) => value + double.parse(element.total));
  }

  double calculateShippingTotal() {
    return order.deliveryMitraModel
            ?.fold(0, (value, element) => value + double.parse(element.fee)) ??
        0;
  }

  double calculateAdminFee() {
    double total = calculateShopTotal() + calculateShippingTotal();
    return (order.paymentChannelModel.channelCategory != "COD")
        ? (order.paymentChannelModel.feeFix == null)
            ? (double.parse(order.paymentChannelModel.feePercentage) / 100) *
                total
            : double.parse(order.paymentChannelModel.feeFix)
        : 0;
  }

  void setOrderTotal() {
    setOrderSummary(order.copyWith(
      shopTotal: calculateShopTotal().toString(),
      deliveryTotal: calculateShippingTotal().toString(),
      adminFeeTotal: calculateAdminFee().toString(),
      total: calculateGrandTotal().toStringAsFixed(0),
    ));
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
      var result = await Get.toNamed('/delivery_detail_page',
          arguments: getOrderTypes());

      if (result != null && result.length > 0) {
        Future.delayed(Duration(milliseconds: 100), () {
          setOrderSummary(order.copyWith(
            deliveryMitraModel: result[0],
            mapAddress: result[1].result.formattedAddress,
          ));

          setOrderTotal();
        });
      }
    });
  }

  Future navigateToPaymentChannelPage() async {
    var payment = await Get.toNamed('/payment_channel_page',
        arguments: order.paymentChannelModel);
    if (payment != null) {
      setPayment(payment);
      setOrderTotal();
    }
  }

  void submitOrder() {
    if (order.deliveryAddressModel != null &&
        order.deliveryMitraModel != null) {
      Get.offAllNamed('/place_order_page', arguments: order);
    } else {
      helper.showToast('Alamat dan tujuan pengiriman tidak boleh kosong');
    }
  }

  void init() {
    if (customerController.customer.deliveryAddressModel.length > 0) {
      setDeliveryAddress(customerController.customer.deliveryAddressModel
          .firstWhere((item) => item.isDefault > 0));
    }

    setOrderItems(items);

    setPayment(paymentChannelController.defaultPayment);

    setOrderTotal();

    setClearCartRule();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
