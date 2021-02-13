import 'package:ayoo/controller/order_page_controller.dart';
import 'package:ayoo/model/order_model.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OrderPageController(),
      builder: (OrderPageController controller) => DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: controller.orderController.fetchOrder,
                icon: Icon(
                  FontAwesomeIcons.redoAlt,
                  size: 16,
                ),
              ),
            ],
            title: Text(
              'Orderan Anda',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            bottom: TabBar(
              indicatorColor: Get.theme.colorScheme.secondary.withOpacity(0.3),
              indicatorWeight: 3,
              tabs: [
                Tab(
                  child: Text(
                    'Pending',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Batal',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Obx(() {
            return (!controller.orderController.loading.value)
                ? TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _listOrder(
                        context,
                        controller.orderController.pendingOrder,
                        controller,
                      ),
                      _listOrder(
                        context,
                        controller.orderController.selesaiOrder,
                        controller,
                      ),
                      _listOrder(
                        context,
                        controller.orderController.batalOrder,
                        controller,
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: Colors.grey[100],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
                    ),
                  );
          }),
        ),
      ),
    );
  }
}

Widget _listOrder(BuildContext context, List<OrderModel> orders,
    OrderPageController controller) {
  return (orders.length > 0)
      ? ListView.separated(
          itemCount: orders.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            OrderModel order = orders[index];
            Color statusColor;

            if (order.orderStatusModel[0].status == 'Pending')
              statusColor = Colors.amber;
            else if (order.orderStatusModel[0].status == 'Selesai')
              statusColor = Colors.green;
            else
              statusColor = Colors.red;

            return Container(
              color: Colors.white,
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#ORDER-00000${index + 1}',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        controller.helper
                            .formatMoney(double.parse(order.total)),
                        style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${order.orderDetailModel.length} (Item)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Tanggal Order',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            controller.helper.parseDate(
                              order.createdAt,
                              dateFormat: DateFormat('dd MMM y'),
                            ),
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        order.orderStatusModel[0].status,
                        style: TextStyle(
                          fontSize: 14,
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      (order.paymentChannelModel.channelCode != 'COD')
                          ? CachedNetworkImage(
                              imageUrl: order.paymentChannelModel.image,
                              width: 60,
                              height: 30,
                              placeholder: (context, index) => AyoShimmer(
                                radius: 6,
                                width: 50,
                                height: 40,
                              ),
                            )
                          : Text(
                              'COD',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            );
          },
        )
      : Container(
          // color: Colors.white,
          child: Center(
            child: Text('Tidak ada data'),
          ),
        );
}
