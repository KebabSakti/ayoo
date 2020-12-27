import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScrollToTopButtonController extends GetxController {
  final ScrollController scrollController;

  ScrollToTopButtonController({@required this.scrollController});

  final scrollToTopButtonTweenEndValue = 0.0.obs;

  void scrollToTop() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeIn,
    );
  }

  void _scrollListener() {
    //hide or show scroll to top button
    if (scrollController.offset > 500) {
      scrollToTopButtonTweenEndValue.value = 1.0;
    } else {
      scrollToTopButtonTweenEndValue.value = 0.0;
    }
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
}
