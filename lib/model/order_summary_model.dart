import 'package:ayoo/model/courier_model.dart';
import 'package:ayoo/model/mitra_model.dart';
import 'package:ayoo/model/order_model.dart';

class OrderSummaryModel {
  List<MitraModel> mitras;
  List<CourierModel> couriers;
  OrderModel order;

  OrderSummaryModel({
    this.mitras,
    this.couriers,
    this.order,
  });

  OrderSummaryModel copyWith({
    List<MitraModel> mitras,
    List<CourierModel> couriers,
    OrderModel order,
  }) =>
      OrderSummaryModel(
        mitras: mitras ?? this.mitras,
        couriers: couriers ?? this.couriers,
        order: order ?? this.order,
      );
}
