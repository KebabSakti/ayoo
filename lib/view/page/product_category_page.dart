import 'package:ayoo/controller/product_category_page_controller.dart';
import 'package:ayoo/view/widget/ayo_carousel_banner.dart';
import 'package:ayoo/view/widget/ayo_home_section.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product_filter.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_panel.dart';
import 'package:ayoo/view/widget/ayo_sticky_widget.dart';
import 'package:ayoo/view/widget/ayo_sub_category.dart';
import 'package:ayoo/view/widget/ayo_vertical_product.dart';
import 'package:ayoo/view/widget/ayo_wrap_product_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

class ProductCategoryPage extends GetView<ProductCategoryPageController> {
  @override
  Widget build(BuildContext context) {
    // final _gridItemRatio =
    //     (Get.size.width / 2) / ((Get.size.height - kToolbarHeight - 200) / 2);
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
                  expandedHeight: Get.size.height / 3,
                  title: GestureDetector(
                    onTap: () => Get.toNamed('/search'),
                    child: AyoSearchBar(),
                  ),
                  actions: [
                    AyoShoppingCart(),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Obx(() {
                      if (!controller.carousel.loading.value) {
                        return AyoCarouselBanner(
                          banners: controller.carousel.carouselBanners,
                          active: controller.carousel.active.value,
                          onPageChanged: controller.carousel.setActive,
                        );
                      }
                      return AyoShimmer(radius: 0);
                    }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverToBoxAdapter(
                  child: AyoHomeSection(
                    height: 250,
                    heading: 'Kategori',
                    tapText: 'Lihat Semua',
                    onTap: () {
                      Get.toNamed('/category');
                    },
                    child: AyoSubCategory(categories: controller.subCategories),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 10,
                    color: Colors.grey[100],
                  ),
                ),
                SliverStickyHeader(
                  header: AyoHorizontalProductFilter(
                    tag: 'ProductCategoryPage',
                    productController: controller.product,
                    panelController: controller.panelController,
                  ),
                  sliver: AyoVerticalProduct(
                    controller: controller.product,
                    scrollController: controller.scrollController,
                    tag: 'ProductCategoryPage',
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
              tag: 'ProductCategoryPage',
              scrollController: controller.scrollController,
            ),
            AyoSlidingUpPanel(
              panelController: controller.panelController,
              panel: AyoWrapPoductFilter(
                tag: 'ProductCategoryPage',
                productController: controller.product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
