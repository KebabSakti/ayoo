import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/home_page_controller.dart';
import 'package:ayoo/controller/main_category_controller.dart';
import 'package:ayoo/controller/most_search_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/view/widget/ayo_carousel_banner.dart';
import 'package:ayoo/view/widget/ayo_home_section.dart';
import 'package:ayoo/view/widget/ayo_horizontal_product.dart';
import 'package:ayoo/view/widget/ayo_main_category.dart';
import 'package:ayoo/view/widget/ayo_popular_search.dart';
import 'package:ayoo/view/widget/ayo_scanner_with_point_bar.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _homePageController = Get.find<HomePageController>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          _homePageController.fetchHomeData();
        },
        child: CustomScrollView(
          controller: Get.find<AppPageController>().scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: Get.size.height / 3,
              pinned: true,
              titleSpacing: 0,
              title: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AyoSearchBar(),
                    ),
                  ),
                  AyoShoppingCart(),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Obx(() {
                  if (!_homePageController.loading.value) {
                    return AyoCarouselBanner(
                      banners:
                          Get.find<CarouselBannerController>().carouselBanners,
                      active: Get.find<CarouselBannerController>().active.value,
                      onPageChanged:
                          Get.find<CarouselBannerController>().setActive,
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
                onTap: () {},
                child: Obx(
                  () => AyoMainCategory(
                    loading: _homePageController.loading.value,
                    categories:
                        Get.find<MainCategoryController>().mainCategories,
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
                onTap: () {},
                child: Obx(
                  () => AyoHorizontalProduct(
                    loading: _homePageController.loading.value,
                    products: Get.find<ProductPaginateController>(
                            tag: 'popular_product')
                        .productPaginateModel
                        .value
                        .data,
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
                onTap: () {},
                child: Obx(
                  () => AyoPopularSearch(
                    loading: _homePageController.loading.value,
                    populars: Get.find<MostSearchController>().mostSearchModel,
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
              child: Container(
                height: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
