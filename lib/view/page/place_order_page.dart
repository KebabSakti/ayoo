import 'package:ayoo/controller/place_order_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PLaceOrderPage extends GetView<PlaceOrderPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed('/app');
        return null;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(() {
            if (!controller.loading.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/ordersuccess.json'),
                  Text(
                    'Orderan anda sudah kami terima, mitra kami akan mengantarkan pesanan anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    onPressed: () {
                      Get.offNamed('/app');
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Get.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Halaman Utama',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation/makeorder.json'),
                SizedBox(height: 60),
                Text(
                  'Membuat orderan, mohon tunggu..',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
