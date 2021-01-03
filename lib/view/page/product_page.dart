import 'package:ayoo/controller/product_page_controller.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product_filter.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_panel.dart';
import 'package:ayoo/view/widget/ayo_sticky_widget.dart';
import 'package:ayoo/view/widget/ayo_vertical_product.dart';
import 'package:ayoo/view/widget/ayo_wrap_product_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductPageController> {
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
              SliverToBoxAdapter(
                child: AyoHorizontalProductFilter(
                  tag: 'ProductPage',
                  productController: controller.productController,
                  panelController: controller.panelController,
                ),
              ),
              AyoVerticalProduct(
                controller: controller.productController,
                scrollController: controller.scrollController,
                tag: 'ProductPage',
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 10,
                ),
              ),
            ],
          ),
          AyoStickyWidget(
            tag: 'ProductPage',
            scrollController: controller.scrollController,
            stickyPosition: 0.0,
            child: AyoHorizontalProductFilter(
              tag: 'ProductPage',
              productController: controller.productController,
              panelController: controller.panelController,
            ),
          ),
          AyoScrollToTopButton(
            tag: 'ProductPage',
            scrollController: controller.scrollController,
          ),
          AyoSlidingUpPanel(
            panelController: controller.panelController,
            panel: AyoWrapPoductFilter(
              tag: 'ProductPage',
              productController: controller.productController,
            ),
          ),
        ],
      ),
    );
  }
}
