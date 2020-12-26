import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/home_page_controller.dart';
import 'package:ayoo/view/widget/ayo_carousel_banner.dart';
import 'package:ayoo/view/widget/ayo_search_bar.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        onRefresh: () async {},
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
                  if (Get.find<CarouselBannerController>()
                          .carouselBanners
                          .length >
                      0) {
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
          ],
        ),
      ),
    );
  }
}
