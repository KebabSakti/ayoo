import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/home_page_controller.dart';
import 'package:ayoo/view/widget/ayo_carousel_banner.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
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
              title: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: Text(
                        'Cari di sini',
                        style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                      ),
                    )
                  ],
                ),
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
