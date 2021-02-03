import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ShoppingCartPageControler extends GetxController {
  final HelperInstance helper = Get.find();
  final ShoppingCartController shoppingCartController = Get.find();
  final ScrollController scrollController = ScrollController();

  Future navigateToOrderSummaryPage() async {
    if (await Permission.location.isGranted == false) {
      Get.dialog(
        AlertDialog(
          title: Center(
            child: FaIcon(
              FontAwesomeIcons.mapMarkerAlt,
              color: Colors.redAccent,
              size: 40,
            ),
          ),
          content: Text(
            'Aplikasi memerlukan akses lokasi perangkat anda',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Batal'),
              onPressed: () {
                Get.back();
              },
            ),
            FlatButton(
              child: Text('Lanjut'),
              onPressed: () async {
                Get.back();
                if (await Permission.location.request().isGranted)
                  Get.toNamed(
                    '/order_summary',
                    arguments: shoppingCartController.shoppingCart,
                  );
              },
            ),
          ],
        ),
      );
    } else {
      Get.toNamed(
        '/order_summary',
        arguments: shoppingCartController.shoppingCart,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
