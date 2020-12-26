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
                child: Stack(
                  children: [
                    PageView(
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Obx(
                          () => TweenAnimationBuilder(
                            curve: Curves.bounceOut,
                            tween: Tween<double>(
                              begin: 0.0,
                              end: controller
                                  .scrollToTopButtonTweenEndValue.value,
                            ),
                            duration: Duration(milliseconds: 300),
                            builder: (context, scale, child) => Transform.scale(
                              scale: scale,
                              child: child,
                            ),
                            child: ClipOval(
                              child: Material(
                                color: Get.theme.primaryColor.withOpacity(0.8),
                                child: InkWell(
                                  child: SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: Icon(
                                      FontAwesomeIcons.arrowUp,
                                      size: 18,
                                    ),
                                  ),
                                  onTap: () {
                                    controller.scrollToTop();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AyoBottomNavigationBar(
                items: [
                  Obx(
                    () => AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.burn,
                      text: 'Home',
                      index: 0,
                      active: controller.appPageViewActive.value,
                      onTap: () {
                        controller.appPageViewNavigateTo(0);
                      },
                    ),
                  ),
                  Obx(
                    () => AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.clipboardList,
                      text: 'Order',
                      index: 1,
                      active: controller.appPageViewActive.value,
                      onTap: () {
                        controller.appPageViewNavigateTo(1);
                      },
                    ),
                  ),
                  Obx(
                    () => AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.solidCommentDots,
                      text: 'Chat',
                      index: 2,
                      active: controller.appPageViewActive.value,
                      onTap: () {
                        controller.appPageViewNavigateTo(2);
                      },
                    ),
                  ),
                  Obx(
                    () => AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.solidBell,
                      text: 'Notif',
                      index: 3,
                      active: controller.appPageViewActive.value,
                      onTap: () {
                        controller.appPageViewNavigateTo(3);
                      },
                    ),
                  ),
                  Obx(
                    () => AyoBottomNavigationBarItem(
                      width: Get.size.width / 5,
                      icon: FontAwesomeIcons.userAlt,
                      text: 'Akun',
                      index: 4,
                      active: controller.appPageViewActive.value,
                      onTap: () {
                        controller.appPageViewNavigateTo(4);
                      },
                    ),
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
