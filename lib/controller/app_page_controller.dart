import 'package:ayoo/controller/product_filter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppPageController extends GetxController {
  final productFilterController = Get.find<ProductFilterController>();
  final appPageViewController = PageController();
  final panelController = PanelController();

  var appPageViewActive = 0.obs;

  void appPageViewNavigateTo(int index) {
    appPageViewActive.value = index;
    appPageViewController.jumpToPage(appPageViewActive.value);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
