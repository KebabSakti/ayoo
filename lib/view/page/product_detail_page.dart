import 'dart:math';

import 'package:ayoo/controller/product_detail_page_controller.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/view/widget/ayo_cart_item_control.dart';
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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetView<ProductDetailPageController> {
  @override
  final String tag = Get.parameters['tag'];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.panelController.panelPosition > 0) {
          //close panel if open
          controller.panelController.close();
        } else {
          Get.back();
        }
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              var loading =
                  controller.productRelatedController.detailLoading.value;
              var product = (!loading)
                  ? controller.productRelatedController.productModel[0]
                  : ProductModel();
              return CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  (!loading)
                      ? SliverAppBar(
                          pinned: true,
                          titleSpacing: 0,
                          expandedHeight: Get.size.height / 2.5,
                          centerTitle: true,
                          title: Text(
                            product.name,
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
                              imageUrl: product.cover,
                              height: Get.size.height / 2.5,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  AyoShimmer(height: Get.size.height / 2.5),
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
                      child: (!loading)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.helper.formatMoney(
                                                    double.parse(controller
                                                        .product.lastPrice)) +
                                                ' / ' +
                                                product.unitModel.unit,
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 6),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 6),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    '${controller.helper.formatMoney(double.parse(product.discount), name: '')}% OFF',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  '${controller.helper.formatMoney(double.parse(product.price))}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey[400],
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            product.name,
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
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.toggleFavourite();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidHeart,
                                        color:
                                            (product.favouriteModel.length > 0)
                                                ? Get.theme.primaryColor
                                                : Colors.grey,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                (!loading)
                                    ? AyoProductDetailStatistic(
                                        productModel: product)
                                    : Padding(
                                        padding: const EdgeInsets.only(top: 6),
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
                                (!loading)
                                    ? AyoDeliveryTypeContainer(
                                        type: product.deliveryTypeModel)
                                    : AyoShimmer(
                                        width: 200,
                                        height: 15,
                                      ),
                              ],
                            )
                          : Column(
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
                      child: (!loading)
                          ? Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.caption,
                                        softWrap: true,
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                      ),
                                      SizedBox(height: 4),
                                      (product.caption.length > 100)
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
                                    product.caption,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            )
                          : Column(
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
                    child: (!loading)
                        ? (product.ratingWeightModel != null)
                            ? Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                arguments: product);
                                          },
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
                                          (product.ratingWeightModel != null)
                                              ? controller.product
                                                  .ratingWeightModel.rating
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
                                          'dari ${product.ratingWeightModel.totalVote} ulasan',
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
                                          initialRating: controller.product
                                                      .ratingWeightModel !=
                                                  null
                                              ? double.parse(controller.product
                                                  .ratingWeightModel.rating)
                                              : 0,
                                          minRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          ignoreGestures: true,
                                          itemSize: 12,
                                          itemPadding: EdgeInsets.symmetric(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .product.ratingModel[0].comment,
                                            softWrap: true,
                                            maxLines: 6,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                          (product.ratingModel[0].comment
                                                      .length >
                                                  100)
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  child: ExpandableButton(
                                                    child: Text(
                                                      "Lihat Detail",
                                                      style: TextStyle(
                                                        color: Get
                                                            .theme.primaryColor,
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
                                                controller.product.ratingModel
                                                    .length)]
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
                            child: Column(
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
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: (!loading)
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
                                                      .product.subCategoryId));
                                        },
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
                            height: 210,
                            child: AyoHorizontalProduct(
                              loading: controller
                                  .productRelatedController.loading.value,
                              products: controller
                                      .productRelatedController.loading.value
                                  ? []
                                  : controller.productRelatedController
                                      .productPaginateModel.value.data
                                      .where((i) =>
                                          i.productId != product.productId)
                                      .toList(),
                            ),
                          ),
                          (!loading) ? SizedBox(height: 50) : SizedBox.shrink(),
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
              var loading =
                  controller.productRelatedController.detailLoading.value;
              return (!loading)
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
                                onPressed: () {},
                                splashColor:
                                    Get.theme.accentColor.withOpacity(0.3),
                                child: Text(
                                  'Beli Langsung',
                                  style:
                                      TextStyle(color: Get.theme.primaryColor),
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
                                splashColor:
                                    Get.theme.accentColor.withOpacity(0.3),
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
              panelController: controller.panelController,
              maxHeight: Get.size.height / 2.5,
              panel: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      var loading = controller
                          .productRelatedController.detailLoading.value;
                      var product = (!loading)
                          ? controller.productRelatedController.productModel[0]
                          : ProductModel();
                      return (!loading)
                          ? Column(
                              children: [
                                Text(
                                  product.name,
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
                                  controller.helper.formatMoney(double.parse(
                                          controller.product.lastPrice)) +
                                      ' / ' +
                                      product.unitModel.unit,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800],
                                  ),
                                )
                              ],
                            )
                          : SizedBox.shrink();
                    }),
                    AyoCartItemControl(
                      qtyField: controller.qtyField,
                      minus: () => controller.shoppingCart
                          .minQty(product: controller.product),
                      plus: () => controller.shoppingCart
                          .plusQty(product: controller.product),
                      change: controller.setQty,
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
                        Obx(() {
                          return Text(
                            (controller.cartItem().total != null)
                                ? controller.helper.formatMoney(
                                    double.parse(controller.cartItem().total))
                                : 'Rp 0',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          );
                        }),
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
  }
}
