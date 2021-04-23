import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/view/widget/ayo_bottom_navigation_bar.dart';
import 'package:ayoo/view/widget/ayo_bottom_navigation_bar_item.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_panel.dart';
import 'package:ayoo/view/widget/ayo_wrap_product_filter.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:move_to_background/move_to_background.dart';

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
                    // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    MoveToBackground.moveTaskToBack();
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
                    controller: controller.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: controller.menus.map((menu) {
                      return menu.page;
                    }).toList(),
                  ),
                ),
                Obx(() {
                  return AyoBottomNavigationBar(
                      items: controller.menus.map((menu) {
                    return AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: menu.icon,
                      text: menu.name,
                      notification: menu.notification,
                      color: controller.activePage.value == menu.index
                          ? Get.theme.primaryColor
                          : Colors.grey[500],
                      onTap: () => controller.activePage(menu.index),
                    );
                  }).toList());
                }),
              ],
            ),
            AyoSlidingUpPanel(
              panelController: controller.panelController,
              panel: AyoWrapPoductFilter(
                productController: controller.productController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ObserverWidget extends StatefulWidget {
//   @override
//   _ObserverWidgetState createState() => _ObserverWidgetState();
// }

// class _ObserverWidgetState extends State<ObserverWidget>
//     with WidgetsBindingObserver {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.shrink();
//   }
// }
