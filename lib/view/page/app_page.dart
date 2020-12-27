import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/view/page/home_page.dart';
import 'package:ayoo/view/page/order_page.dart';
import 'package:ayoo/view/widget/ayo_bottom_navigation_bar.dart';
import 'package:ayoo/view/widget/ayo_bottom_navigation_bar_item.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_panel.dart';
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

        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AyoSlidingUpPanel(
          controller: controller.appPanelController,
          defaultPanelState: PanelState.CLOSED,
          maxHeight: 500.0,
          minHeight: 0.0,
          panel: Center(
            child: Text('Slideee'),
          ),
          body: Column(
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
        ),
      ),
    );
  }
}
