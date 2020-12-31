import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/controller/ayo_slidding_up_panel_controller.dart';
import 'package:ayoo/controller/product_page_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/view/page/home_page.dart';
import 'package:ayoo/view/page/order_page.dart';
import 'package:ayoo/view/widget/ayo_bottom_navigation_bar.dart';
import 'package:ayoo/view/widget/ayo_bottom_navigation_bar_item.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_panel.dart';
import 'package:ayoo/view/widget/ayo_wrap_product_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppPage extends GetView<AppPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.panelController.panelPosition > 0) {
          //close panel if open
          controller.panelController.close();
        } else {
          Get.dialog(
            AlertDialog(
              content: Text('Keluar dari aplikasi?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Tidak'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                FlatButton(
                  child: Text('Ya'),
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                ),
              ],
            ),
          );
        }

        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.appPageViewController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      HomePage(),
                      OrderPage(),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
                AyoBottomNavigationBar(
                  items: [
                    AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.shoppingCart,
                      text: 'Home',
                      index: 0,
                    ),
                    AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.clipboardList,
                      text: 'Order',
                      index: 1,
                    ),
                    AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.solidCommentDots,
                      text: 'Chat',
                      index: 2,
                    ),
                    AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.solidBell,
                      text: 'Notif',
                      index: 3,
                    ),
                    AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.userAlt,
                      text: 'Akun',
                      index: 4,
                    ),
                  ],
                ),
              ],
            ),
            SlidingUpPanel(
              controller: controller.panelController,
              defaultPanelState: PanelState.CLOSED,
              minHeight: 0,
              backdropEnabled: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 16.0,
                  spreadRadius: 0.2,
                  offset: Offset(0.0, 1),
                ),
              ],
              panel: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: FaIcon(
                      FontAwesomeIcons.minus,
                      color: Colors.grey[400],
                    ),
                  ),
                  Expanded(
                    child: AyoWrapPoductFilter(
                      controller: Get.find<ProductPaginateController>(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
