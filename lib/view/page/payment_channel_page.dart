import 'package:ayoo/controller/payment_channel_page_controller.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PaymentChannelPage extends GetView<PaymentChannelPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Pilih Metode Pembayaran',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Stack(
        children: [
          Obx(() {
            return ListView.separated(
              itemCount: controller.paymentController.paymentChannels.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    controller.selectPayment(
                        controller.paymentController.paymentChannels[index]);
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  leading: CachedNetworkImage(
                    imageUrl: controller
                        .paymentController.paymentChannels[index].image,
                    width: 50,
                    height: 40,
                    placeholder: (context, index) => AyoShimmer(
                      radius: 6,
                      width: 50,
                      height: 40,
                    ),
                  ),
                  trailing: (controller.selectedPaymend.businessId ==
                          controller.paymentController.paymentChannels[index]
                              .businessId)
                      ? Icon(
                          FontAwesomeIcons.checkCircle,
                          size: 20,
                          color: Colors.green,
                        )
                      : SizedBox.shrink(),
                  title: Text(
                    '${controller.paymentController.paymentChannels[index].name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
