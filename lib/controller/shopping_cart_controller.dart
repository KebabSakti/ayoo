import 'package:ayoo/model/shoppin_cart_model.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  var shoppingCart = List<ShoppingCartModel>().obs;
  var totalItem = 0.obs;

  Future setShoppingCart(List<ShoppingCartModel> carts) async {
    shoppingCart.assignAll(carts);
  }

  void setTotalItem(int total) {
    totalItem.value = total;
  }

  @override
  void onInit() {
    ever(shoppingCart, (carts) {
      setTotalItem(carts.fold(0, (value, element) => value + element.qty));
    });

    super.onInit();
  }
}
