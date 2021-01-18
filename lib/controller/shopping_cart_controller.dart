import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/model/shopping_cart_model.dart';
import 'package:ayoo/repo/remote/shopping_cart_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  final ShoppingCartApi _cartApi = ShoppingCartApi();

  var shoppingCart = List<ShoppingCartModel>().obs;
  var shoppingCartItem = ShoppingCartModel().obs;

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

  void setShoppingCartItem(ShoppingCartModel cartItem) {
    shoppingCartItem.value = cartItem;
  }

  void updateShoppingCart(String productId) {
    var index = shoppingCart.indexWhere((i) => i.productId == productId);
    shoppingCart[index] = ShoppingCartModel();
  }

  int getCartItemIndex(String productId) {
    return shoppingCart.indexWhere((i) => i.productId == productId);
  }

  void plusQty({@required ProductModel product, int count = 1}) {
    var index = getCartItemIndex(product.productId);
    if (index >= 0) {
      int qty = shoppingCart[index].qty + count;
      shoppingCart[index] = shoppingCart[index].copyWith(
        qty: qty,
        total: (qty * double.parse(product.lastPrice)).toString(),
      );
    } else {
      shoppingCart.add(ShoppingCartModel(
        productId: product.productId,
        checked: 1,
        price: product.lastPrice,
        qty: count,
        total: product.lastPrice,
        product: product,
      ));
    }
  }

  void minQty({@required ProductModel product, int count = 1}) {
    var index = getCartItemIndex(product.productId);
    if (index >= 0) {
      int qty = shoppingCart[index].qty - count;
      if (qty > 0) {
        shoppingCart[index] = shoppingCart[index].copyWith(
          qty: qty,
          total: (qty * double.parse(product.lastPrice)).toString(),
        );
      } else {
        removeProductById(product.productId);
      }
    }
  }

  void setQty({@required ProductModel product, @required int qty}) {
    var index = getCartItemIndex(product.productId);
    if (qty > 0) {
      if (index >= 0) {
        shoppingCart[index] = shoppingCart[index].copyWith(
          qty: qty,
          total: (qty * double.parse(product.lastPrice)).toString(),
        );
      } else {
        shoppingCart.add(ShoppingCartModel(
          productId: product.productId,
          checked: 1,
          price: product.lastPrice,
          qty: qty,
          total: product.lastPrice,
          product: product,
        ));
      }
    } else {
      if (index >= 0) {
        removeProductById(product.productId);
      }
    }
  }

  void setNote({@required ProductModel product, @required String note}) {
    var index = getCartItemIndex(product.productId);
    shoppingCart[index] = shoppingCart[index].copyWith(note: note);
  }

  void removeProductById(String productId) {
    shoppingCart.assignAll(
        shoppingCart.where((i) => i.productId != productId).toList());
  }

  @override
  void onInit() {
    ever(shoppingCart, (carts) {
      setTotalItem(carts.fold(0, (value, element) => value + element.qty));
      setTotalPaid(carts.fold(
          0.0, (value, element) => value + double.parse(element.total)));
    });

    debounce(shoppingCart, (carts) {
      _cartApi.uploadShoppingCart(carts: carts);
    }, time: Duration(seconds: 1));

    super.onInit();
  }
}
