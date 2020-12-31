import 'package:ayoo/controller/product_page_controller.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product_filter.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductPageController> {
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
                title: Row(
                  children: [
                    Expanded(
                      child: AyoSearchBar(
                        hint: controller
                            .productController.productQueryModel.value.keyword,
                      ),
                    ),
                    AyoShoppingCart(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: AyoHorizontalProductFilter(
                    controller: controller.productController),
              ),
            ],
          ),
          AyoScrollToTopButton(
            scrollController: controller.scrollController,
          ),
        ],
      ),
    );
  }
}
