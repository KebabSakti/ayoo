import 'package:ayoo/model/order_detail_model.dart';

class CheckoutItemModel {
  List<OrderDetailModel> items;
  bool clearShoppingCart;

  CheckoutItemModel({
    this.items,
    this.clearShoppingCart = false,
  });
}
