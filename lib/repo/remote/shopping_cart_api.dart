import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/shopping_cart_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartApi {
  final DioInstance _dio = Get.find();

  Future<bool> uploadShoppingCart(
      {@required List<ShoppingCartModel> carts}) async {
    try {
      await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post(
            'cart/update',
            data: d.FormData.fromMap({
              "item": carts
                  .map((e) => {
                        'product_id': e.product.productId,
                        'checked': e.checked,
                        'price': e.price,
                        'qty': e.qty,
                        'total': e.total,
                        'note': e.note,
                      })
                  .toList(),
            }),
          );

      return true;
    } on d.DioError catch (_) {
      return null;
    }
  }
}
