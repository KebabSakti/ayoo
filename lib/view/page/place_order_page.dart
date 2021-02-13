import 'package:ayoo/controller/place_order_page_controller.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PLaceOrderPage extends GetView<PlaceOrderPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.navigateToHome();
        return null;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(() {
            if (!controller.loading.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/ordersuccess.json'),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Order anda sudah kami terima, mitra kami akan mengantarkan pesanan anda',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () {
                          controller.navigateToHome();
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
                      (controller.order.paymentChannelModel.channelCode !=
                              'COD')
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: OutlineButton(
                                onPressed: () {},
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                borderSide: BorderSide(
                                  color: Get.theme.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Bayar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Get.theme.primaryColor,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    CachedNetworkImage(
                                      imageUrl: controller
                                          .order.paymentChannelModel.image,
                                      width: 40,
                                      height: 30,
                                      placeholder: (context, index) =>
                                          AyoShimmer(
                                        radius: 6,
                                        width: 50,
                                        height: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
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
