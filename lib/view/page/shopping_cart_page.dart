import 'package:ayoo/controller/shopping_cart_page_controller.dart';
import 'package:ayoo/view/widget/ayo_cart_item_control.dart';
import 'package:ayoo/view/widget/ayo_delivery_type_container.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ShoppingCartPage extends GetView<ShoppingCartPageControler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                titleSpacing: 0,
                title: Text(
                  'Keranjang Belanja',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: false,
                    removeLeft: false,
                    removeRight: false,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          controller.shoppingCartController.shoppingCart.length,
                      itemBuilder: (context, index) {
                        var cartItem = controller
                            .shoppingCartController.shoppingCart[index];
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: CachedNetworkImage(
                                    imageUrl: cartItem.product.cover,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => AyoShimmer(),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cartItem.product.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.grey[800],
                                            fontSize: 12,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.solidTimesCircle,
                                          color: Colors.grey[800],
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    AyoDeliveryTypeContainer(
                                      type: cartItem.product.deliveryTypeModel,
                                    ),
                                    // Text(
                                    //   controller.helper.formatMoney(
                                    //       double.parse(cartItem.total)),
                                    //   style: TextStyle(
                                    //     fontSize: 12,
                                    //     fontWeight: FontWeight.w600,
                                    //     color: Colors.grey[800],
                                    //   ),
                                    // ),
                                    // SizedBox(height: 15),
                                  ],
                                ),
                                Spacer(),
                                SizedBox(width: 10),
                              ],
                            ),
                            Divider(height: 30),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
