import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('Detail Product'),
          onPressed: () => Get.toNamed('/product_page'),
        ),
      ),
    );
  }
}
