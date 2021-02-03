import 'package:ayoo/model/courier_model.dart';
import 'package:ayoo/model/customer_model.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/model/delivery_detail_model.dart';
import 'package:ayoo/model/mitra_model.dart';
import 'package:ayoo/model/order_model.dart';
import 'package:ayoo/model/payment_channel_model.dart';
import 'package:ayoo/model/shopping_cart_model.dart';

class OrderSummaryModel {
  DeliveryAddressModel deliveryAddress;
  List<DeliveryDetailModel> deliveryDetails;
  List<MitraModel> mitras;
  List<CourierModel> couriers;
  List<ShoppingCartModel> orderItems;
  PaymentChannelModel payment;
  OrderModel summary;
  CustomerModel customer;

  OrderSummaryModel({
    this.deliveryAddress,
    this.deliveryDetails,
    this.mitras,
    this.couriers,
    this.orderItems,
    this.payment,
    this.summary,
    this.customer,
  });

  OrderSummaryModel copyWith({
    DeliveryAddressModel deliveryAddress,
    List<DeliveryDetailModel> deliveryDetails,
    List<MitraModel> mitras,
    List<CourierModel> couriers,
    List<ShoppingCartModel> orderItems,
    PaymentChannelModel payment,
    OrderModel summary,
    CustomerModel customer,
  }) =>
      OrderSummaryModel(
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        deliveryDetails: deliveryDetails ?? this.deliveryDetails,
        mitras: mitras ?? this.mitras,
        couriers: couriers ?? this.couriers,
        orderItems: orderItems ?? this.orderItems,
        payment: payment ?? this.payment,
        summary: summary ?? this.summary,
        customer: customer ?? this.customer,
      );
}
