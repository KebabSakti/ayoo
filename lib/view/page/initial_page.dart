import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/controller/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, bottom: 50, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: SvgPicture.asset('assets/images/shop.svg'),
                ),
                SizedBox(height: 20),
                Text(
                  'Belanja cepat, aman, lengkap semua ada di genggaman tangan kamu',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Obx(() {
              if (Get.find<AuthController>().auth.value.token.isNotEmpty) {
                Get.find<IntroController>().fetchIntroImage();
              }

              if (Get.find<AuthController>().error.value ||
                  Get.find<IntroController>().error.value) {
                return Column(
                  children: [
                    Icon(
                      Icons.cloud_off,
                      color: Colors.red,
                      size: 40,
                    ),
                    Text(
                      'Gagal terhubung',
                      style: TextStyle(fontSize: 10),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        Get.find<AuthController>().requestGuestAccess();
                      },
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: Colors.grey[100],
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Menghubungkan',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
