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
import 'package:get/get.dart';

class ProductCategoryPage extends GetView<ProductCategoryPageController> {
  @override
  Widget build(BuildContext context) {
    // final _gridItemRatio =
    //     (Get.size.width / 2) / ((Get.size.height - kToolbarHeight - 200) / 2);
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
                expandedHeight: Get.size.height / 3,
                title: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Get.toNamed('/search'),
                        child: AyoSearchBar(),
                      ),
                    ),
                    AyoShoppingCart(),
                  ],
                ),
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
                child: SizedBox(
                  height: 10,
                ),
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
              SliverToBoxAdapter(
                child: AyoHorizontalProductFilter(
                  tag: 'ProducCategoryPage',
                  productController: controller.product,
                  panelController: controller.panelController,
                ),
              ),
              AyoVerticalProduct(
                controller: controller.product,
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
            scrollController: controller.scrollController,
            stickyPosition: 410,
            tag: 'ProductCategoryPage',
            child: AyoHorizontalProductFilter(
              tag: 'ProducCategoryPage',
              productController: controller.product,
              panelController: controller.panelController,
            ),
          ),
          AyoScrollToTopButton(
            tag: 'ProducCategoryPage',
            scrollController: controller.scrollController,
          ),
          AyoSlidingUpPanel(
            panelController: controller.panelController,
            panel: AyoWrapPoductFilter(
              tag: 'ProducCategoryPage',
              productController: controller.product,
            ),
          ),
        ],
      ),
    );
  }
}
