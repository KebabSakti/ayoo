import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:ayoo/controller/main_category_controller.dart';
import 'package:ayoo/controller/search_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/repo/remote/initial_home_api.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final _initialHomeApi = InitialHomeApi();

  final _carouselBannerController = Get.find<CarouselBannerController>();
  final _mainCategoryController = Get.find<MainCategoryController>();
  final _productPaginatePopularController =
      Get.find<ProductPaginateController>(tag: 'Popular');
  final _productPaginateController = Get.find<ProductPaginateController>();
  final _searchController = Get.find<SearchController>(tag: 'MostSearch');

  var loading = true.obs;
  var error = false.obs;

  Future fetchHomeData() async {
    loading.value = true;

    await _initialHomeApi.fetchInitialHome().then((data) async {
      await _carouselBannerController
          .setCarouselBanners(data.carouselBannerModel);
      await _mainCategoryController.setMainCategories(data.mainCategoryModel);
      await _productPaginatePopularController
          .setProductPaginateModel(data.productPopularPaginateModel);
      await _productPaginateController
          .setProductPaginateModel(data.productPaginateModel);
      await _searchController.setSearchModel(data.mostSearchModel);
    });

    loading.value = false;
  }

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }
}
