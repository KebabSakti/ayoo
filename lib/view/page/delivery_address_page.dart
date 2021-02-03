import 'package:ayoo/controller/delivery_address_page_controller.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DeliveryAddressPage extends GetView<DeliveryAddressPageController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => controller.init(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(
            'List Alamat',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await controller.navigateToAddAddressPage();
              },
              icon: Icon(
                FontAwesomeIcons.plus,
                size: 18,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Obx(() {
              if (controller.loading.value == false &&
                  controller.address.length == 0) {
                return _empty();
              }

              return ListView.separated(
                controller: controller.scrollController,
                separatorBuilder: (context, index) => Divider(height: 1),
                itemCount: (!controller.loading.value)
                    ? controller.address.length
                    : 10,
                itemBuilder: (context, index) {
                  if (controller.loading.value) {
                    return _loader();
                  }

                  return ListTile(
                    onTap: () {
                      controller
                          .selectDeliveryAddress(controller.address[index]);
                    },
                    onLongPress: () {
                      controller.showAddressAction(controller.address[index]);
                    },
                    contentPadding: EdgeInsets.all(15),
                    title: Row(
                      children: [
                        Text(
                          '${controller.address[index].title}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 4),
                        (index == 0)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  color: Colors.green[100],
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 6,
                                  ),
                                  child: Text(
                                    'Utama',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        // Spacer(),
                        // IconButton(
                        //   onPressed: () {},
                        //   constraints:
                        //       BoxConstraints(maxHeight: 16, maxWidth: 16),
                        //   icon: Icon(
                        //     FontAwesomeIcons.ellipsisV,
                        //     color: Colors.grey[800],
                        //     size: 16,
                        //   ),
                        // ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            '${controller.address[index].name} (${controller.address[index].phone})',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        Text(
                          '${controller.address[index].address}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
            AyoScrollToTopButton(
              tag: 'DeliveryAddressPage',
              scrollController: controller.scrollController,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _empty() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.houseUser,
          color: Colors.grey[300],
          size: 50,
        ),
        SizedBox(height: 20),
        Text(
          'Belum ada alamat tersimpan, gunakan tombol + untuk menambah alamat',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}

Widget _loader() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AyoShimmer(
          width: 100,
          height: 10,
          radius: 10,
        ),
        SizedBox(height: 4),
        AyoShimmer(
          width: 130,
          height: 10,
          radius: 10,
        ),
        SizedBox(height: 4),
        AyoShimmer(
          width: 200,
          height: 10,
          radius: 10,
        ),
        SizedBox(height: 4),
        AyoShimmer(
          width: 150,
          height: 10,
          radius: 10,
        ),
      ],
    ),
  );
}
