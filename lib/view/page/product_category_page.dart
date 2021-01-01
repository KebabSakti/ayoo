import 'package:ayoo/controller/product_category_page_controller.dart';
import 'package:ayoo/view/widget/ayo_carousel_banner.dart';
import 'package:ayoo/view/widget/ayo_home_section.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product_filter.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_product_filter.dart';
import 'package:ayoo/view/widget/ayo_sticky_widget.dart';
import 'package:ayoo/view/widget/ayo_vertical_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductCategoryPage extends GetView<ProductCategoryPageController> {
  @override
  Widget build(BuildContext context) {
    final _gridItemRatio =
        (Get.size.width / 2) / ((Get.size.height - kToolbarHeight - 200) / 2);
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
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.subCategories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          color: Colors.grey[100],
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network(
                                    controller.subCategories[index].image,
                                    width: 40,
                                    height: 40,
                                    placeholderBuilder: (context) => AyoShimmer(
                                      width: 40,
                                      height: 40,
                                      radius: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    controller.subCategories[index].title,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                child: AyoHorizontalProductFilter(
                  controller: controller.product,
                  panelController: controller.panelController,
                  productFilterController: controller.productFilter,
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
            stickyPosition: 1096,
            child: AyoHorizontalProductFilter(
              controller: controller.product,
              panelController: controller.panelController,
              productFilterController: controller.productFilter,
            ),
          ),
          AyoScrollToTopButton(
            scrollController: controller.scrollController,
          ),
          AyoSlidingUpProductFilter(
            panelController: controller.panelController,
            productController: controller.product,
            productFilterController: controller.productFilter,
          ),
        ],
      ),
    );
  }
}
