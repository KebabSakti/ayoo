import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppPageController extends GetxController {
  final PageController appPageViewController = PageController();
  final PanelController appPanelController = PanelController();
  final ScrollController scrollController = ScrollController();

  var appPageViewActive = 0.obs;
  var scrollPosition = 0.0;
  var scrollToTopButtonTweenEndValue = 0.0.obs;

  void appPageViewNavigateTo(int index) {
    scrollToTopButtonTweenEndValue.value = 0.0;
    appPageViewActive.value = index;
    appPageViewController.jumpToPage(appPageViewActive.value);
  }

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
    if (scrollController.offset > 2500) {
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
