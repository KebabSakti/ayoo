import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/model/main_menu_model.dart';
import 'package:ayoo/view/page/home_page.dart';
import 'package:ayoo/view/page/order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppPageController extends GetxController {
  final ProductPaginateController productController = Get.find();

  final PageController pageController = PageController();
  final PanelController panelController = PanelController();

  final menus = [
    MainMenuModel(
      index: 0,
      name: 'Home',
      icon: FontAwesomeIcons.shoppingCart,
      page: HomePage(),
    ),
    MainMenuModel(
      index: 1,
      name: 'Order',
      icon: FontAwesomeIcons.clipboardList,
      page: OrderPage(),
    ),
    MainMenuModel(
      index: 2,
      name: 'Chat',
      icon: FontAwesomeIcons.solidCommentDots,
      page: Container(),
    ),
    MainMenuModel(
      index: 3,
      name: 'Notif',
      icon: FontAwesomeIcons.solidBell,
      page: Container(),
    ),
    MainMenuModel(
      index: 4,
      name: 'Akun',
      icon: FontAwesomeIcons.userAlt,
      page: Container(),
    )
  ].obs;

  final activePage = 0.obs;

  void showNotifMenu(String target, bool value) {
    menus.assignAll(menus.map((item) {
      if (item.name == target) {
        return item.copyWith(notification: value);
      }
      return item;
    }).toList());
  }

  @override
  void onInit() {
    ever(activePage, (index) {
      pageController.jumpToPage(index);
    });
    super.onInit();
  }
}
