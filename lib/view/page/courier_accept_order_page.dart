import 'package:ayoo/controller/courier_accept_order_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CourierAcceptOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourierAcceptOrderPageController>(
      init: CourierAcceptOrderPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.grey[800], //change your color here
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/courier_success.svg',
                    width: 300,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Kurir sudah menerima orderan anda\nDuduk manis saja di rumah, kurir kami akan mengantarkan pesanan anda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  FlatButton(
                    onPressed: () {},
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Get.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Lihat detail order',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
