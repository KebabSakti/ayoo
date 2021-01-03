import 'package:ayoo/controller/product_detail_page_controller.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                expandedHeight: Get.size.height / 3,
                title: GestureDetector(
                  onTap: () => Get.toNamed('/search'),
                  child: AyoSearchBar(),
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 500,
                ),
              ),
            ],
          ),
          AyoScrollToTopButton(
            tag: 'ProductDetailPage',
            scrollController: controller.scrollController,
          ),
        ],
      ),
    );
  }
}
