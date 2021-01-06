import 'dart:math';

import 'package:ayoo/controller/product_detail_page_controller.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product.dart';
import 'package:ayoo/view/widget/ayo_product_detail_statistic.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetView<ProductDetailPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                titleSpacing: 0,
                expandedHeight: Get.size.height / 2.5,
                centerTitle: true,
                title: Text(
                  controller.product.name,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                actions: [
                  AyoShoppingCart(),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                    imageUrl: controller.product.cover,
                    height: Get.size.height / 3,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        AyoShimmer(height: Get.size.height / 3),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.helper.formatMoney(double.parse(
                                        controller.product.lastPrice)) +
                                    ' / ' +
                                    controller.product.unitModel.unit,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Row(
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
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        '${controller.helper.formatMoney(double.parse(controller.product.discount), name: '')}% OFF',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      '${controller.helper.formatMoney(double.parse(controller.product.price))}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[400],
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                controller.product.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 6),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.grey,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      AyoProductDetailStatistic(
                        productModel: controller.product,
                      ),
                    ],
                  ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Produk',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        removeLeft: true,
                        removeRight: true,
                        removeTop: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.product.productInfoModel.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller
                                      .product.productInfoModel[index].caption,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  controller.product.productInfoModel[index]
                                      .description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.product.caption,
                              softWrap: true,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 4),
                            (controller.product.caption.length > 100)
                                ? ExpandableButton(
                                    child: Text(
                                      "Lihat Detail",
                                      style: TextStyle(
                                        color: Get.theme.primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        expanded: Text(
                          controller.product.caption,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 10,
                  color: Colors.grey[100],
                ),
              ),
              SliverToBoxAdapter(
                child: (controller.product.ratingWeightModel != null)
                    ? Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  onTap: () {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Lihat Semua',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Get.theme.primaryColor,
                                          fontWeight: FontWeight.bold,
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
                                  color:
                                      (controller.product.ratingWeightModel !=
                                              null)
                                          ? Colors.amberAccent
                                          : Colors.grey[400],
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  (controller.product.ratingWeightModel != null)
                                      ? controller
                                          .product.ratingWeightModel.rating
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
                                  'dari ${controller.product.ratingWeightModel.totalVote} ulasan',
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
                                  initialRating:
                                      controller.product.ratingWeightModel !=
                                              null
                                          ? double.parse(controller
                                              .product.ratingWeightModel.rating)
                                          : 0,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  itemSize: 12,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
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
                                        text: controller.product.ratingModel[0]
                                            .customerModel.name,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.product.ratingModel[0].comment,
                                    softWrap: true,
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                  (controller.product.ratingModel[0].comment
                                              .length >
                                          100)
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: ExpandableButton(
                                            child: Text(
                                              "Lihat Detail",
                                              style: TextStyle(
                                                color: Get.theme.primaryColor,
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
                                        controller.product.ratingModel.length)]
                                    .comment,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 10,
                  color: Colors.grey[100],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lihat Semua',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Get.theme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Obx(
                        () => Container(
                          height: 210,
                          child: AyoHorizontalProduct(
                            loading: controller
                                .productRelatedController.loading.value,
                            products: controller.productRelatedController
                                .productPaginateModel.value.data,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
            ],
          ),
          Positioned(
            bottom: 56,
            right: 0,
            child: AyoScrollToTopButton(
              tag: 'ProductDetailPage',
              scrollController: controller.scrollController,
            ),
          ),
          Align(
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
                      onPressed: () {},
                      splashColor: Get.theme.accentColor.withOpacity(0.3),
                      child: Text(
                        'Beli Langsung',
                        style: TextStyle(color: Get.theme.primaryColor),
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
                      onPressed: () {},
                      splashColor: Get.theme.accentColor.withOpacity(0.3),
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
          ),
        ],
      ),
    );
  }
}
