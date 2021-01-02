import 'package:ayoo/controller/product_page_controller.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product_filter.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_product_filter.dart';
import 'package:ayoo/view/widget/ayo_sticky_widget.dart';
import 'package:ayoo/view/widget/ayo_vertical_product.dart';
import 'package:ayoo/view/widget/ayo_wrap_product_filter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
                title: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Get.offNamed('/search'),
                        child: AyoSearchBar(
                          hint: controller.productController.productQueryModel
                              .value.keyword,
                        ),
                      ),
                    ),
                    AyoShoppingCart(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: AyoHorizontalProductFilter(
                  controller: controller.productController,
                  panelController: controller.panelController,
                  productFilterController: controller.productFilterController,
                ),
              ),
              AyoVerticalProduct(
                controller: controller.productController,
                scrollController: controller.scrollController,
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
              controller: controller.productController,
              panelController: controller.panelController,
              productFilterController: controller.productFilterController,
            ),
          ),
          AyoScrollToTopButton(
            scrollController: controller.scrollController,
            tag: 'ProductPage',
          ),
          AyoSlidingUpProductFilter(
            panelController: controller.panelController,
            productController: controller.productController,
            productFilterController: controller.productFilterController,
          ),
        ],
      ),
    );
  }
}
