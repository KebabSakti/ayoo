import 'package:ayoo/model/carousel_banner_model.dart';
import 'package:ayoo/repo/remote/carousel_banner_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselBannerController extends GetxController {
  final _carouselBannerApi = CarouselBannerApi();

  var carouselBanners = List<CarouselBannerModel>().obs;
  var active = 0.obs;
  var loading = true.obs;
  var error = false.obs;

  Future fetchCarouselBanner({
    @required String target,
    String id,
  }) async {
    loading.value = true;

    await _carouselBannerApi
        .fetchCarouselBanner(target: target)
        .then((banners) {
      if (banners != null) {
        setCarouselBanners(banners);
      } else {
        error.value = true;
      }
    });

    loading.value = false;
  }

  Future setCarouselBanners(List<CarouselBannerModel> banners) async {
    carouselBanners.assignAll(banners);
  }

  void setActive(int index) {
    active.value = index;
  }
}
