import 'package:ayoo/controller/contoh_controller.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ContohController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: AyoSearchBar(),
              ),
            ),
            AyoShoppingCart(),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text(controller.asd.value),
        ),
      ),
    );
  }
}
