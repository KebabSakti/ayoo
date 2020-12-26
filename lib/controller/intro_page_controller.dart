import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class IntroPageController extends GetxController {
  final CarouselController carouselController = CarouselController();
  var activeSlider = 0.obs;
}
