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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: false,
                    removeLeft: false,
                    removeRight: false,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(height: 20),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.shoppingCartController.shoppingCart.length,
                      itemBuilder: (context, index) {
                        var cartItem = controller
                            .shoppingCartController.shoppingCart[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: CachedNetworkImage(
                                  imageUrl: cartItem.product.cover,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => AyoShimmer(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          cartItem.product.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.grey[800],
                                            // fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: FaIcon(
                                          FontAwesomeIcons.times,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  AyoDeliveryTypeContainer(
                                    type: cartItem.product.deliveryTypeModel,
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.helper.formatMoney(
                                            double.parse(cartItem.total)),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox.fromSize(
                                            size: Size(30, 30),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.grey[200],
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Center(
                                                    child: FaIcon(
                                                      FontAwesomeIcons.minus,
                                                      size: 10,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox.fromSize(
                                            size: Size(30, 30),
                                            child: Center(
                                              child: TextField(
                                                textAlign: TextAlign.center,
                                                showCursor: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      3),
                                                ],
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[800],
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: '1',
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          SizedBox.fromSize(
                                            size: Size(30, 30),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.grey[200],
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Center(
                                                    child: FaIcon(
                                                      FontAwesomeIcons.plus,
                                                      size: 10,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
