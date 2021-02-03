import 'package:ayoo/controller/order_summary_page_controller.dart';
import 'package:ayoo/model/delivery_type_model.dart';
import 'package:ayoo/view/widget/ayo_delivery_type_container.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderSummaryPage extends GetView<OrderSummaryPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            titleSpacing: 0,
            centerTitle: true,
            title: Text(
              'Ringkasan Belanja',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alamat Pengiriman',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await controller.navigateToDeliveryAddressPage();
                            },
                            child: Text(
                              'Set Alamat',
                              style: TextStyle(
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 15),
                      Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (controller.summary.deliveryAddress != null)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '${controller.summary.deliveryAddress.title}',
                                              textAlign: TextAlign.justify,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          (controller.summary.deliveryAddress
                                                      .isDefault >
                                                  0)
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Container(
                                                    color: Colors.green[100],
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 6,
                                                    ),
                                                    child: Text(
                                                      'Utama',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox.shrink(),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '${controller.summary.deliveryAddress.name} (${controller.summary.deliveryAddress.phone})',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '${controller.summary.deliveryAddress.address}',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    'Belum ada alamat tersimpan',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () async {
                                await controller.navigateToDeliveryDetailPage();
                              },
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Get.theme.colorScheme.secondary
                                  .withOpacity(0.3),
                              child: Ink(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey[300],
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          color: Colors.redAccent,
                                          size: 20,
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: (controller.summary
                                                                .deliveryDetails !=
                                                            null &&
                                                        controller
                                                                .summary
                                                                .deliveryDetails
                                                                .length >
                                                            0)
                                                    ? Text(
                                                        '${controller.summary.deliveryDetails[0].description}',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[800],
                                                        ),
                                                      )
                                                    : Text(
                                                        'Set lokasi pengiriman',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.grey[800],
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                              ),
                                              // SizedBox(width: 15),
                                              // FaIcon(
                                              //   FontAwesomeIcons.chevronRight,
                                              //   color: Colors.grey[600],
                                              //   size: 12,
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    (controller.summary.deliveryDetails !=
                                                null &&
                                            controller.summary.deliveryDetails
                                                    .length >
                                                0)
                                        ? ListView.separated(
                                            separatorBuilder:
                                                (context, index) =>
                                                    Divider(height: 20),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .summary.deliveryDetails.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${controller.summary.deliveryDetails[index].mitraModel[0].name}',
                                                  style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 6),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Jarak',
                                                      style: TextStyle(
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                    Text(
                                                      '${controller.helper.formatMoney(double.parse(controller.summary.deliveryDetails[index].distance), digit: 1, name: '')} km',
                                                      style: TextStyle(
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 6),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Ongkir',
                                                      style: TextStyle(
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                    Text(
                                                      '${controller.helper.formatMoney(double.parse(controller.summary.deliveryDetails[index].fee))}',
                                                      style: TextStyle(
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child:
                                                      AyoDeliveryTypeContainer(
                                                    type: controller
                                                        .summary
                                                        .deliveryDetails[index]
                                                        .deliveryTypeModel[0],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                  color: Colors.grey[100],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: MediaQuery.removePadding(
                    removeBottom: false,
                    removeLeft: false,
                    removeRight: false,
                    removeTop: true,
                    context: context,
                    child: ListView.separated(
                      itemCount: controller.summary.orderItems.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                        height: 30,
                      ),
                      itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: CachedNetworkImage(
                                  imageUrl: controller
                                      .summary.orderItems[index].product.cover,
                                  height: 60,
                                  width: 70,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => AyoShimmer(),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.summary.orderItems[index].product.name}',
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${controller.summary.orderItems[index].qty} item (${controller.summary.orderItems[index].qty} ${controller.summary.orderItems[index].product.unitModel.unit})',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${controller.helper.formatMoney(double.parse(controller.summary.orderItems[index].total))}',
                                      style: TextStyle(
                                        color: Get.theme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    AyoDeliveryTypeContainer(
                                      type: DeliveryTypeModel(
                                        instant: controller
                                            .summary
                                            .orderItems[index]
                                            .product
                                            .deliveryTypeModel
                                            .instant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          (controller.summary.orderItems[index].note != null)
                              ? Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  width: double.infinity,
                                  child: Text(
                                    '${controller.summary.orderItems[index].note}',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  color: Colors.grey[100],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Metode Pembayaran',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: Get.theme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          // Container(
                          //   width: 50,
                          //   height: 40,
                          //   color: Colors.grey,
                          // ),
                          CachedNetworkImage(
                            imageUrl: controller.summary.payment.image,
                            width: 50,
                            height: 40,
                            placeholder: (context, index) => AyoShimmer(
                              radius: 6,
                              width: 50,
                              height: 40,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${controller.summary.payment.name}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 25),
                      Text(
                        'Rincian Pembayaran',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Belanja',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Obx(() {
                            return Text(
                              '${controller.helper.formatMoney(double.parse(controller.summary.summary.shopTotal))}',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Ongkir',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Obx(() {
                            return Text(
                              '${controller.helper.formatMoney(double.parse(controller.summary.summary.deliveryTotal))}',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Biaya Admin',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Obx(() {
                            return Text(
                              '${controller.helper.formatMoney(double.parse(controller.summary.summary.adminFeeTotal))}',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(height: 10),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.grey[200],
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Bayar',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Obx(() {
                  return Text(
                    '${controller.helper.formatMoney(controller.calculateGrandTotal())}',
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  );
                }),
              ],
            ),
            FlatButton(
              onPressed: () async {},
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Get.theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Buat Orderan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
