import 'dart:math';

import 'package:ayoo/controller/product_detail_page_controller.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/view/widget/ayo_delivery_type_container.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product.dart';
import 'package:ayoo/view/widget/ayo_product_detail_statistic.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_panel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final String tag = Random().nextInt(999999999).toString();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProductDetailPageController(),
        tag: tag,
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.panelController.panelPosition > 0) {
                //close panel if open
                controller.panelController.close();
              } else if (controller.beliLangsungPanel.panelPosition > 0) {
                controller.beliLangsungPanel.close();
              } else {
                Get.back();
              }

              return false;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  Obx(() {
                    return CustomScrollView(
                      controller: controller.scrollController,
                      slivers: [
                        (!controller.loading.value)
                            ? SliverAppBar(
                                pinned: true,
                                titleSpacing: 0,
                                expandedHeight: Get.size.height / 2.5,
                                centerTitle: true,
                                title: Text(
                                  controller.productDetail.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                actions: [
                                  AyoShoppingCart(),
                                ],
                                flexibleSpace: FlexibleSpaceBar(
                                  background: CachedNetworkImage(
                                    imageUrl: controller.productDetail.cover,
                                    height: Get.size.height / 2.5,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => AyoShimmer(
                                        height: Get.size.height / 2.5),
                                  ),
                                ),
                              )
                            : SliverToBoxAdapter(
                                child: AyoShimmer(
                                  radius: 0,
                                  height: Get.size.height / 2.5,
                                ),
                              ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: (!controller.loading.value)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.helper.formatMoney(
                                                    double.parse(controller
                                                        .productDetail
                                                        .lastPrice)) +
                                                ' / ' +
                                                controller.productDetail
                                                    .unitModel.unit,
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          // IconButton(
                                          //   onPressed: () {
                                          //     controller.toggleFavourite();
                                          //   },
                                          //   constraints:
                                          //       BoxConstraints(minHeight: 2),
                                          //   icon: (controller.productDetail
                                          //               .favouriteModel.length >
                                          //           0)
                                          //       ? Icon(
                                          //           FontAwesomeIcons.solidHeart,
                                          //           color:
                                          //               Get.theme.primaryColor,
                                          //         )
                                          //       : Icon(
                                          //           FontAwesomeIcons.heart,
                                          //           color: Colors.grey[800],
                                          //         ),
                                          // ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.toggleFavourite();
                                            },
                                            child: Icon(
                                              (controller
                                                          .productDetail
                                                          .favouriteModel
                                                          .length >
                                                      0)
                                                  ? FontAwesomeIcons.solidHeart
                                                  : FontAwesomeIcons.heart,
                                              color: (controller
                                                          .productDetail
                                                          .favouriteModel
                                                          .length >
                                                      0)
                                                  ? Get.theme.primaryColor
                                                  : Colors.grey[800],
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 6,
                                              right: 6,
                                              top: 4,
                                              bottom: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.amberAccent,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              '${controller.helper.formatMoney(double.parse(controller.productDetail.discount), name: '')}% OFF',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            '${controller.helper.formatMoney(double.parse(controller.productDetail.price))}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[400],
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        controller.productDetail.name,
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      (!controller.loading.value)
                                          ? AyoProductDetailStatistic(
                                              productModel:
                                                  controller.productDetail)
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Row(
                                                children: [
                                                  AyoShimmer(
                                                    width: 100,
                                                    height: 15,
                                                  ),
                                                  SizedBox(width: 6),
                                                  AyoShimmer(
                                                    width: 100,
                                                    height: 15,
                                                  ),
                                                  SizedBox(width: 6),
                                                  AyoShimmer(
                                                    width: 100,
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                      SizedBox(height: 10),
                                      (!controller.loading.value)
                                          ? AyoDeliveryTypeContainer(
                                              type: controller.productDetail
                                                  .deliveryTypeModel)
                                          : AyoShimmer(
                                              width: 200,
                                              height: 15,
                                            ),
                                    ],
                                  )
                                : _productDetailShimmer(),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: 10,
                            color: Colors.grey[100],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: (!controller.loading.value)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Deskripsi Produk',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      ExpandablePanel(
                                        collapsed: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.productDetail.caption,
                                              softWrap: true,
                                              maxLines: 6,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                            ),
                                            SizedBox(height: 4),
                                            (controller.productDetail.caption
                                                        .length >
                                                    100)
                                                ? ExpandableButton(
                                                    child: Text(
                                                      "Lihat Detail",
                                                      style: TextStyle(
                                                        color: Get
                                                            .theme.primaryColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                        expanded: Text(
                                          controller.productDetail.caption,
                                          softWrap: true,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  )
                                : _productDetailShimmer(),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: 10,
                            color: Colors.grey[100],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: (!controller.loading.value)
                              ? (controller.productDetail.ratingWeightModel !=
                                      null)
                                  ? Container(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Ulasan Pembeli',
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed('/product_review',
                                                      arguments: controller
                                                          .productDetail);
                                                },
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Lihat Semua',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Get
                                                            .theme.primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: (controller.product
                                                            .ratingWeightModel !=
                                                        null)
                                                    ? Colors.amberAccent
                                                    : Colors.grey[400],
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                (controller.productDetail
                                                            .ratingWeightModel !=
                                                        null)
                                                    ? controller
                                                        .product
                                                        .ratingWeightModel
                                                        .rating
                                                        .toString()
                                                    : '0',
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                'dari ${controller.productDetail.ratingWeightModel.totalVote} ulasan',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              RatingBar(
                                                initialRating: controller
                                                            .product
                                                            .ratingWeightModel !=
                                                        null
                                                    ? double.parse(controller
                                                        .product
                                                        .ratingWeightModel
                                                        .rating)
                                                    : 0,
                                                minRating: 0,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                ignoreGestures: true,
                                                itemSize: 12,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 2.0),
                                                ratingWidget: RatingWidget(
                                                  empty: Icon(
                                                    Icons.star,
                                                    color: Colors.grey,
                                                  ),
                                                  half: Icon(
                                                    Icons.star_half,
                                                    color: Colors.amber,
                                                  ),
                                                  full: Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                                onRatingUpdate: (_) {},
                                              ),
                                              SizedBox(width: 4),
                                              RichText(
                                                text: TextSpan(
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.grey[800],
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'oleh ',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: controller
                                                          .product
                                                          .ratingModel[0]
                                                          .customerModel
                                                          .name,
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6),
                                          ExpandablePanel(
                                            collapsed: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.product
                                                      .ratingModel[0].comment,
                                                  softWrap: true,
                                                  maxLines: 6,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.justify,
                                                ),
                                                (controller
                                                            .productDetail
                                                            .ratingModel[0]
                                                            .comment
                                                            .length >
                                                        100)
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 4),
                                                        child: ExpandableButton(
                                                          child: Text(
                                                            "Lihat Detail",
                                                            style: TextStyle(
                                                              color: Get.theme
                                                                  .primaryColor,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox.shrink(),
                                              ],
                                            ),
                                            expanded: Text(
                                              controller
                                                  .product
                                                  .ratingModel[Random().nextInt(
                                                      controller.product
                                                          .ratingModel.length)]
                                                  .comment,
                                              softWrap: true,
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: _productDetailShimmer(),
                                ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: 10,
                            color: Colors.grey[100],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: (!controller.loading.value)
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Produk Terkait',
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    '/product/' +
                                                        Random()
                                                            .nextInt(999999999)
                                                            .toString(),
                                                    arguments: ProductQueryModel(
                                                        subCategoryId: controller
                                                            .product
                                                            .subCategoryId));
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Lihat Semua',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Get
                                                          .theme.primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AyoShimmer(
                                              width: 100,
                                              height: 15,
                                            ),
                                            AyoShimmer(
                                              width: 100,
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 230,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: (!controller.loading.value)
                                        ? AyoHorizontalProduct(
                                            loading: controller
                                                .productRelated.loading.value,
                                            products: (!controller
                                                    .productRelated
                                                    .loading
                                                    .value)
                                                ? controller
                                                    .productRelated
                                                    .productPaginateModel
                                                    .value
                                                    .data
                                                    .where(
                                                      (i) =>
                                                          i.productId !=
                                                          controller
                                                              .productDetail
                                                              .productId,
                                                    )
                                                    .toList()
                                                : [],
                                          )
                                        : AyoHorizontalProduct(
                                            loading: true,
                                            products: [],
                                          ),
                                  ),
                                ),
                                (!controller.loading.value)
                                    ? SizedBox(height: 50)
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  Positioned(
                    bottom: 56,
                    right: 0,
                    child: AyoScrollToTopButton(
                      tag: tag,
                      scrollController: controller.scrollController,
                    ),
                  ),
                  Obx(() {
                    return (!controller.loading.value)
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 56,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: () async {
                                        // controller.navigateToOrderSummaryPage();
                                        controller.beliLangsungPanel.open();
                                      },
                                      splashColor: Get.theme.accentColor
                                          .withOpacity(0.3),
                                      child: Text(
                                        'Beli Langsung',
                                        style: TextStyle(
                                            color: Get.theme.primaryColor),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.5,
                                          style: BorderStyle.solid,
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: () {
                                        controller.panelController.open();
                                      },
                                      splashColor: Get.theme.accentColor
                                          .withOpacity(0.3),
                                      color: Get.theme.primaryColor,
                                      child: Text(
                                        '+ Keranjang',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink();
                  }),
                  AyoSlidingUpPanel(
                    panelController: controller.beliLangsungPanel,
                    maxHeight: Get.size.height / 2.5,
                    panel: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return (!controller.loading.value)
                                ? Column(
                                    children: [
                                      Text(
                                        controller.productDetail.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        controller.helper.formatMoney(
                                                double.parse(controller
                                                    .product.lastPrice)) +
                                            ' / ' +
                                            controller
                                                .productDetail.unitModel.unit,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink();
                          }),
                          Column(
                            children: [
                              SizedBox(
                                width: 280,
                                child: TextField(
                                  controller: controller.noteField
                                    ..text
                                    ..selection = TextSelection.fromPosition(
                                        TextPosition(
                                            offset: controller
                                                .noteField.text.length)),
                                  showCursor: true,
                                  keyboardType: TextInputType.text,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[800],
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Note untuk produk ini',
                                    isDense: true, // Added this
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 12,
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              FlatButton(
                                onPressed: () {
                                  controller.navigateToOrderSummaryPage();
                                },
                                splashColor:
                                    Get.theme.accentColor.withOpacity(0.3),
                                color: Get.theme.primaryColor,
                                child: Text(
                                  'Lanjut',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AyoSlidingUpPanel(
                    panelController: controller.panelController,
                    maxHeight: Get.size.height / 2.5,
                    panel: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return (!controller.loading.value)
                                ? Column(
                                    children: [
                                      Text(
                                        controller.productDetail.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        controller.helper.formatMoney(
                                                double.parse(controller
                                                    .product.lastPrice)) +
                                            ' / ' +
                                            controller
                                                .productDetail.unitModel.unit,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink();
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {
                                    controller.shoppingCart
                                        .minQty(product: controller.product);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  color: Colors.grey[50],
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              SizedBox(width: 4),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey[50],
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: controller.qtyField
                                    ..text
                                    ..selection = TextSelection.fromPosition(
                                        TextPosition(
                                            offset: controller
                                                .qtyField.text.length)),
                                  textAlign: TextAlign.center,
                                  showCursor: false,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800],
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (value) {
                                    controller.shoppingCart.setQty(
                                        product: controller.product,
                                        qty: int.parse(value));
                                  },
                                ),
                              ),
                              SizedBox(width: 4),
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {
                                    controller.shoppingCart
                                        .plusQty(product: controller.product);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  color: Colors.grey[50],
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(height: 4),
                              Obx(
                                () {
                                  return Text(
                                    (controller.cartItem().total != null)
                                        ? controller.helper.formatMoney(
                                            double.parse(
                                                controller.cartItem().total))
                                        : 'Rp 0',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget _productDetailShimmer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AyoShimmer(
        width: 200,
        height: 15,
      ),
      SizedBox(height: 6),
      AyoShimmer(
        width: 250,
        height: 15,
      ),
      SizedBox(height: 6),
      AyoShimmer(
        width: 150,
        height: 15,
      ),
    ],
  );
}
