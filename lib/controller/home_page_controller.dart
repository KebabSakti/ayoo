import 'package:ayoo/controller/carousel_banner_controller.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final _carouselBannerController =
      Get.put<CarouselBannerController>(CarouselBannerController());

  Future fetchHomeData() async {
    //fetch home banner
    _carouselBannerController.fetchCarouselBanner(target: 'home');
  }

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }
}
