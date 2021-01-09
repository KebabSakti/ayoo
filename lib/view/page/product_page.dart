import 'package:ayoo/controller/product_page_controller.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product_filter.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_panel.dart';
import 'package:ayoo/view/widget/ayo_vertical_product.dart';
import 'package:ayoo/view/widget/ayo_wrap_product_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductPageController> {
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
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  titleSpacing: 0,
                  title: GestureDetector(
                    onTap: () => Get.offNamed('/search'),
                    child: AyoSearchBar(
                      hint: controller
                          .productController.productQueryModel.value.keyword,
                    ),
                  ),
                  actions: [
                    AyoShoppingCart(),
                  ],
                ),
                SliverStickyHeader(
                  header: AyoHorizontalProductFilter(
                    tag: tag,
                    productController: controller.productController,
                    panelController: controller.panelController,
                  ),
                  sliver: AyoVerticalProduct(
                    controller: controller.productController,
                    scrollController: controller.scrollController,
                    tag: tag,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 10,
                  ),
                ),
              ],
            ),
            AyoScrollToTopButton(
              tag: tag,
              scrollController: controller.scrollController,
            ),
            AyoSlidingUpPanel(
              panelController: controller.panelController,
              panel: AyoWrapPoductFilter(
                tag: tag,
                productController: controller.productController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
