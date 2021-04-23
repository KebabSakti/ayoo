import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/model/main_menu_model.dart';
import 'package:ayoo/view/page/account_page.dart';
import 'package:ayoo/view/page/chat_page.dart';
import 'package:ayoo/view/page/home_page.dart';
import 'package:ayoo/view/page/notifikasi_page.dart';
import 'package:ayoo/view/page/order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppPageController extends GetxController with WidgetsBindingObserver {
  final CustomerController _customerController = Get.find();

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
      page: ChatPage(),
    ),
    MainMenuModel(
      index: 3,
      name: 'Notif',
      icon: FontAwesomeIcons.solidBell,
      page: NotifikasiPage(),
    ),
    MainMenuModel(
      index: 4,
      name: 'Akun',
      icon: FontAwesomeIcons.userAlt,
      page: AccountPage(),
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
    WidgetsBinding.instance.addObserver(this);

    ever(activePage, (index) {
      pageController.jumpToPage(index);
    });

    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);

    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state.toString());

    if (state == AppLifecycleState.resumed) {
      _customerController.status(status: "Online");
    } else if (state == AppLifecycleState.paused) {
      _customerController.status(status: "Offline");
    }
  }
}
