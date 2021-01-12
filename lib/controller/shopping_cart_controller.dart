import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/model/shoppin_cart_model.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  var shoppingCart = List<ShoppingCartModel>().obs;
  var totalItem = 0.obs;
  var totalPaid = 0.0.obs;

  Future setShoppingCart(List<ShoppingCartModel> carts) async {
    shoppingCart.assignAll(carts);
  }

  void setTotalItem(int total) {
    totalItem.value = total;
  }

  void setTotalPaid(double total) {
    totalPaid.value = total;
  }

  ShoppingCartModel getProductFromCart(String productId) {
    return shoppingCart.firstWhere((i) => i.productId == productId);
  }

  void updateShoppingCart(ProductModel product) {
    shoppingCart.assignAll(shoppingCart);
  }

  void addQty() {}

  @override
  void onInit() {
    ever(shoppingCart, (carts) {
      setTotalItem(
          carts.fold(totalItem.value, (value, element) => value + element.qty));
      setTotalPaid(carts.fold(totalPaid.value,
          (value, element) => value + double.parse(element.total)));
    });

    super.onInit();
  }
}
