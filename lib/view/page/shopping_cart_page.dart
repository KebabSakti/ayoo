import 'dart:math';

import 'package:ayoo/controller/shopping_cart_page_controller.dart';
import 'package:ayoo/view/widget/ayo_delivery_type_container.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  centerTitle: true,
                  title: Text(
                    'Keranjang Belanja',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: false,
                      removeLeft: false,
                      removeRight: false,
                      child: Obx(() {
                        if (controller
                                .shoppingCartController.shoppingCart.length ==
                            0) {
                          return Container(
                            height: Get.size.height - 112,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/empty_cart.svg',
                                  width: Get.size.width / 1.5,
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    'Keranjang kamu masih kosong',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                FlatButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  color: Get.theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    'Mulai Belanja',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(height: 30),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller
                              .shoppingCartController.shoppingCart.length,
                          itemBuilder: (context, index) {
                            var cartItem = controller
                                .shoppingCartController.shoppingCart[index];
                            return Column(
                              key: ValueKey(cartItem.productId),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.offNamed(
                                            '/product_detail/' +
                                                Random()
                                                    .nextInt(999999999)
                                                    .toString(),
                                            arguments: cartItem.product,
                                            preventDuplicates: false);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: CachedNetworkImage(
                                          imageUrl: cartItem.product.cover,
                                          width: 80,
                                          height: 70,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              AyoShimmer(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  cartItem.product.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.grey[800],
                                                    // fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .shoppingCartController
                                                      .removeProductById(
                                                          cartItem.productId);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 7),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.times,
                                                    color: Colors.redAccent,
                                                    size: 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          AyoDeliveryTypeContainer(
                                            type: cartItem
                                                .product.deliveryTypeModel,
                                          ),
                                          // SizedBox(height: 25),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                controller.helper.formatMoney(
                                                    double.parse(
                                                        cartItem.total)),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Get.theme.primaryColor,
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
                                                          onTap: () {
                                                            controller.minQty(
                                                                index,
                                                                cartItem
                                                                    .product);
                                                          },
                                                          child: Center(
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .minus,
                                                              size: 10,
                                                              color: Colors
                                                                  .redAccent,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox.fromSize(
                                                    size: Size(40, 30),
                                                    child: Center(
                                                      child: TextField(
                                                        controller: controller
                                                                .textFieldControllers[
                                                            index]
                                                          ..text = cartItem.qty
                                                              .toString()
                                                          ..selection = TextSelection
                                                              .fromPosition(TextPosition(
                                                                  offset: controller
                                                                      .textFieldControllers[
                                                                          index]
                                                                      .text
                                                                      .length)),
                                                        textAlign:
                                                            TextAlign.center,
                                                        showCursor: false,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              3),
                                                        ],
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[800],
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                        onSubmitted: (value) {
                                                          controller
                                                              .shoppingCartController
                                                              .setQty(
                                                            product: cartItem
                                                                .product,
                                                            qty: int.parse(
                                                                value),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox.fromSize(
                                                    size: Size(30, 30),
                                                    child: ClipOval(
                                                      child: Material(
                                                        color: Colors.grey[200],
                                                        child: InkWell(
                                                          onTap: () {
                                                            controller.plusQty(
                                                                index,
                                                                cartItem
                                                                    .product);
                                                          },
                                                          child: Center(
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .plus,
                                                              size: 10,
                                                              color:
                                                                  Colors.green,
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
                                ),
                                SizedBox(height: 2),
                                TextField(
                                  controller: controller
                                      .noteFieldControllers[index]
                                    ..text = cartItem.note?.toString()
                                    ..selection = TextSelection.fromPosition(
                                        TextPosition(
                                            offset: controller
                                                .noteFieldControllers[index]
                                                .text
                                                .length)),
                                  textAlign: TextAlign.left,
                                  showCursor: true,
                                  cursorColor: Colors.grey[800],
                                  cursorWidth: 1,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600],
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Tambah Catatan',
                                    isDense: true,
                                    hintStyle: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 2,
                                    ),
                                  ),
                                  onSubmitted: (value) {
                                    controller.shoppingCartController.setNote(
                                        product: cartItem.product, note: value);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => (controller.shoppingCartController.shoppingCart.length > 0)
              ? Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Colors.grey[100],
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]),
                          ),
                          Obx(() {
                            return Text(
                              '${controller.shoppingCartController.totalItem.value} Item',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[800]),
                            );
                          }),
                        ],
                      ),
                      Obx(() {
                        return Text(
                          controller.helper.formatMoney(
                            controller.shoppingCartController.totalPaid.value,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Get.theme.primaryColor,
                          ),
                        );
                      }),
                      FlatButton(
                        onPressed: () {},
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        color: Get.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Lanjut',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ));
  }
}
