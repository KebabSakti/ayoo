import 'package:ayoo/controller/contoh_controller.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  final _satu = Get.find<ContohController>(tag: 'Satu');
  // final _dua = Get.find<ContohController>(tag: 'Dua');
  final _tiga = Get.find<ContohController>(tag: 'Tiga');

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
          child: Text('proudct page'),
        ),
      ),
    );
  }
}
