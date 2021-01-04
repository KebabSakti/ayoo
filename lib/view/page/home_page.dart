import 'package:ayoo/controller/home_page_controller.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/model/search_query.dart';
import 'package:ayoo/view/widget/ayo_carousel_banner.dart';
import 'package:ayoo/view/widget/ayo_home_section.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product_filter.dart';
import 'package:ayoo/view/widget/ayo_main_category.dart';
import 'package:ayoo/view/widget/ayo_popular_search.dart';
import 'package:ayoo/view/widget/ayo_scanner_with_point_bar.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:ayoo/view/widget/ayo_sticky_widget.dart';
import 'package:ayoo/view/widget/ayo_vertical_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetBuilder(
      init: HomePageController(),
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          controller.fetchHomeData();
        },
        child: Stack(
          children: [
            CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: Get.size.height / 3,
                  pinned: true,
                  titleSpacing: 0,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/search'),
                      child: AyoSearchBar(),
                    ),
                  ),
                  actions: [
                    AyoShoppingCart(),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Obx(() {
                      if (!controller.loading.value) {
                        return AyoCarouselBanner(
                          banners: controller
                              .carouselBannerController.carouselBanners,
                          active:
                              controller.carouselBannerController.active.value,
                          onPageChanged:
                              controller.carouselBannerController.setActive,
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
                  child: AyoScannerWithPointBar(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverToBoxAdapter(
                  child: AyoHomeSection(
                    heading: 'Kategori',
                    tapText: 'Lihat Semua',
                    onTap: () {
                      Get.toNamed('/category');
                    },
                    child: Obx(
                      () => AyoMainCategory(
                        loading: controller.loading.value,
                        categories:
                            controller.mainCategoryController.mainCategories,
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
                  child: AyoHomeSection(
                    heading: 'Promo',
                    tapText: 'Lihat Semua',
                    onTap: () {},
                    child: Builder(
                      builder: (context) {
                        var images = [
                          'https://image.freepik.com/free-vector/discount-social-media-banner-sale-liquid-background_92715-50.jpg',
                          'https://image.freepik.com/free-vector/abstract-colorful-big-sale-banner_23-2148345098.jpg',
                          'https://image.freepik.com/free-vector/end-season-summer-sale-horizontal-banner_23-2148633748.jpg',
                        ];

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Material(
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(10),
                                  splashColor: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.3),
                                  child: Ink(
                                    width: Get.size.width - 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          images[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
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
                  child: AyoHomeSection(
                    height: 250,
                    heading: 'Produk Terlaris',
                    tapText: 'Lihat Semua',
                    onTap: () {
                      Get.toNamed('/product',
                          arguments: ProductQueryModel(terlaris: 1));
                    },
                    child: Obx(
                      () => AyoHorizontalProduct(
                        loading: controller.loading.value,
                        products: controller.productPaginatePopularController
                            .productPaginateModel.value.data,
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
                  child: AyoHomeSection(
                    heading: 'Paling Dicari',
                    tapText: 'Refresh',
                    icon: Icons.refresh,
                    onTap: () {
                      controller.searchController.loading.value = true;
                      controller.searchController
                          .setSearchQuery(query: SearchQuery());
                    },
                    child: Obx(
                      () => AyoPopularSearch(
                        loading: controller.loading.value ||
                            controller.searchController.loading.value,
                        populars: controller.searchController.searchModel,
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
                    panelController: controller.panelController,
                    productController: controller.productPaginateController,
                  ),
                ),
                AyoVerticalProduct(
                  controller: controller.productPaginateController,
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
                panelController: controller.panelController,
                productController: controller.productPaginateController,
              ),
            ),
            AyoScrollToTopButton(
              scrollController: controller.scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
