import 'package:ayoo/controller/product_page_controller.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product_filter.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
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
            ],
          ),
          AyoScrollToTopButton(
            scrollController: controller.scrollController,
          ),
          SlidingUpPanel(
            controller: controller.panelController,
            defaultPanelState: PanelState.CLOSED,
            minHeight: 0,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 16.0,
                spreadRadius: 0.2,
                offset: Offset(0.0, 1),
              ),
            ],
            panel: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.minus,
                    color: Colors.grey[400],
                  ),
                ),
                Expanded(
                  child: AyoWrapPoductFilter(
                    controller: controller.productController,
                    productFilterController: controller.productFilterController,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
